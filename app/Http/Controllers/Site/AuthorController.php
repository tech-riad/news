<?php

namespace App\Http\Controllers\Site;

use App\Http\Controllers\Controller;
use App\User;
use Aws\S3\Exception\S3Exception as S3;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Sentinel;
use Carbon\Carbon;
use Image;
use File;
use LaravelLocalization;
use Illuminate\Http\Request;
use Modules\Post\Entities\Post;

class AuthorController extends Controller
{
//    users see author profile
    public function profile($id){
        $author     = Sentinel::findById($id);

        $articles   = Post::where('user_id',$id)->where('visibility', 1)
                            ->where('status', 1)
                            ->when(Sentinel::check()== false, function ($query) {
                                $query->where('auth_required',0); })
                            ->orderBy('id', 'desc')
                            ->where('language', LaravelLocalization::setLocale() ?? settingHelper('default_language'))
                            ->limit(12)
                            ->get();

        $totalPostCount = Post::where('visibility', 1)
                            ->where('status', 1)
                            ->when(Sentinel::check()== false, function ($query) {
                                $query->where('auth_required',0); })
                            ->orderBy('id', 'desc')
                            ->where('language', LaravelLocalization::setLocale() ?? settingHelper('default_language'))
                            ->count();

        if($author != null):
            return view('site.pages.author.profile', compact('author','articles','totalPostCount'));
        else:
            return response()->view('site.pages.404');
        endif;
    }

    public function  myProfile(){
        $articles   = Post::where('user_id', Sentinel::getUser()->id)->where('visibility', 1)
            ->where('status', 1)
            ->when(Sentinel::check()== false, function ($query) {
                $query->where('auth_required',0); })
            ->orderBy('id', 'desc')
            ->where('language', LaravelLocalization::setLocale() ?? settingHelper('default_language'))
            ->limit(12)->get();

        $totalPostCount = Post::where('user_id',Sentinel::getUser()->id)->where('visibility', 1)
            ->where('status', 1)
            ->when(Sentinel::check()== false, function ($query) {
                $query->where('auth_required',0); })
            ->orderBy('id', 'desc')
            ->where('language', LaravelLocalization::setLocale() ?? settingHelper('default_language'))
            ->count();

        return view('site.pages.author.my_profile', compact('articles', 'totalPostCount'));
    }
    public function  myProfileEdit(){

        return view('site.pages.author.edit_profile');
    }
    public function  myProfileUpdate(Request $request){
        if (strtolower(\Config::get('app.demo_mode')) == 'yes'):
            return redirect()->back()->with('error', 'You are not allowed to add/modify in demo mode.');
        endif;
        $validation = Validator::make($request->all(), [
            'first_name' => 'required',
            'last_name' => 'required|min:2|max:30',
            'profile_image' => 'mimes:jpg,JPG,JPEG,jpeg,png|max:5120',
            'phone'         => ['min:11','max:14'],
            'dob'           => 'required',
            'gender'        => 'required',
        ])->validate();

        $image = $request->file('profile_image');

        $user           = Sentinel::getUser();

        if(isset($image)):
//            make unique name for image
            $currentDate = Carbon::now()->toDateString();
            $imageName  = $request->first_name.'-'.$currentDate.'-'.uniqid().'.'.$image->getClientOriginalExtension();

            if (strpos(php_sapi_name(), 'cli') !== false  || defined('LARAVEL_START_FROM_PUBLIC')) :

                $directory              = 'images/';
            else:
                $directory              = 'public/images/';
            endif;

            $profileImgUrl             = $directory . $imageName;

            if (strpos(php_sapi_name(), 'cli') !== false || defined('LARAVEL_START_FROM_PUBLIC')) {
                $path = '';
            }else{
                $path = 'public/';
            }

            if (File::exists($path.$user->profile_image) && !blank($user->profile_image)) :
                unlink($path.$user->profile_image);
            endif;
            Image::make($image)->fit(260, 200)->save($profileImgUrl);

            $user->profile_image    = str_replace("public/","",$profileImgUrl);

            $user->save();

        endif;

        $user->first_name   = $request->first_name;
        $user->last_name    = $request->last_name;
        $user->phone        = $request->phone;
        $user->dob          = $request->dob;
        $user->gender       = $request->gender;
        $user->about_us     = $request->about;

        $user->save();

        return redirect()->back()->with('success', __('successfully_updated'));
    }
    public function  social(){
        $socials = Sentinel::getUser()->social_media;
        return view('site.pages.author.social',compact('socials'));
    }
    public function  socialUpdate(Request $request){
        $inputs             = $request->except(['_token']);

        $user              = Sentinel::getUser();
        $user->social_media     = $inputs;
        $user->save();

        return redirect()->back()->with('success', __('successfully_updated'));
    }
    public function  preference(){
        $preferences = Sentinel::findById(1)->permissions;
        return view('site.pages.author.preference',compact('preferences'));
    }
    public function  preferenceUpdate(Request $request){
        $inputs             = $request->except(['_token']);

        $user               = Sentinel::getUser();
        $user->permissions   = $inputs;
        $user->save();

        return redirect()->back()->with('success', __('successfully_updated'));
    }
    public function  changePassword(){
        return view('site.pages.author.change_password');
    }
}
