<?php

namespace App\Http\Controllers\Site;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Socialite;
use Auth;
use Modules\User\Entities\User;
use Sentinel;
use Activation;
use DB;

class SocialController extends Controller
{
    public function redirect($provider)
    {
    	return Socialite::driver($provider)->redirect();
    }

    public function Callback($provider)
    {

        try{

            $userSocial 	=   Socialite::driver($provider)->stateless()->user();
            $users       	=   User::where('email', $userSocial->getEmail())->first();
            $name           = explode(' ', $userSocial->getName());
            $credentials = [
                'first_name'          => $name[0],
                'last_name'          => $name[1],
                'email'             => $userSocial->getEmail(),
                'password'        => 'social-login',
            ];

            if($users){
                if($users->is_user_banned == 0) {
                    return redirect()->back()->with(['error' => __('your_account_is_banned')]);
                }
                Sentinel::authenticate($credentials);
                return redirect('/');
            }else{

                $user               = Sentinel::register($credentials);
                $role               = Sentinel::findRoleBySlug('user');
                $role->users()->attach($user);
                $activation         = Activation::create($user);
                Activation::complete($user, $activation->code);
                Sentinel::authenticate($credentials);
                return redirect('/');
            }

        } catch(\Exception $e) {
           DB::rollBack();
           return redirect('login')->with(['error' => __('something_went_wrong_please_check_your_social_login_settings')]);

        }


    }


}
