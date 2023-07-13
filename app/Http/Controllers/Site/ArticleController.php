<?php

namespace App\Http\Controllers\Site;

use App\Http\Controllers\Controller;
use App\Services\WidgetService;
use Aws\S3\Exception\S3Exception as S3;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;
use Modules\Appearance\Entities\ThemeSection;
use Modules\Gallery\Entities\Audio;
use Modules\Gallery\Entities\Video;
use Modules\Gallery\Entities\Image as galleryImage;
use Modules\Post\Entities\Category;
use Modules\Post\Entities\SubCategory;
use Modules\Post\Entities\Post;
use Modules\Setting\Entities\Setting;
use File;
use Image;
use LaravelLocalization;
use App\VisitorTracker;
use App\Reaction;
use Sentinel;
use Modules\Ads\Entities\Ad;

class ArticleController extends Controller
{
	public function show($id)
	{
		$post = Post::with(['image', 'comments' => function ($query) {
			return $query->whereNull('comment_id');
		}, 'comments.reply.user', 'comments.user'])
			->where('slug', $id)->first();

		if (!blank($post)) {

			$post->total_hit = $post->total_hit+1;
			$post->timestamps = false;

			$post->save();

			if ($post->auth_required == 1 && Sentinel::check() == false) {
				return view('site.pages.403');
			}
		} else {
			return view('site.pages.404');
		}
		$post               = Post::with(['image','quizQuestions','quizQuestions.quizAnswers','quizResults','comments'=> function ($query) {
										return $query->whereNull('comment_id');
									}, 'comments.reply.user', 'comments.user'])
									->where('slug', $id)->first();

//		dd($post);

		$widgetService      = new WidgetService();
		$widgets            = $widgetService->getWidgetDetails();
		$socialLinks        = $this->socialLinks();

		// additional content
		$post_contents = [];
		if(!blank($post->contents)):
	        foreach($post->contents as $key=>$content){
	            $content_type = array_keys($content);
	            //$post_contents[] = $type[0];
	            foreach($content as $value){

	                $abc = [];
	                foreach($value as $key => $item){

	                    if($key == 'image_id' && $key != ""){
	                        $image = galleryImage::find($item);
	                        $abc[] = [$key => $item, 'image' => $image];
	                    }elseif($key == 'video_thumbnail_id' && $key != ""){
	                        $image = galleryImage::find($item);
	                        $abc[] = [$key => $item, 'video_thumbnail' => $image];
	                    }elseif($key == 'video_id' && $key != ""){
	                        $video = Video::find($item);
	                        $abc[] = [$key => $item, 'video' => $video];

	                    }elseif($key == 'ads' && $key != ""){

	                        $ads_info = Ad::find($item);

	                        if($ads_info->ad_type == 'image'){

	                            $detail = galleryImage::find($ads_info->ad_image_id);

	                        }elseif($ads_info->ad_type == 'code'){

	                            $detail = $ads_info->ad_code;

	                        }elseif($ads_info->ad_type == 'text'){

	                            $detail = $ads_info->ad_text;
	                        }

	                        $abc[] = [$key => $item, 'ads_type' => $ads_info->ad_type, 'detail' => $detail];
	                    }else{
	                        $abc[] = [$key => $item];
	                    }
	                }
	                $post_contents[] =[$content_type[0] => $abc];
	            }
	        }
	    endif;

		$categoryWithPost = Category::with(['post' => function ($query) use ($post) {
			return $query->limit(8)->orderBy('id', 'desc')->where('id', '!=', $post->id);
		}])->find($post->category_id);
		$relatedPost = data_get($categoryWithPost, 'post');

		$data['is_you'] = Reaction::where('post_id', $post->id)->where('ip_address', \Request::ip())->first();
//        $audios_array[] =array();
		if ($post->post_type == "audio"):
			foreach ($post->audio as $key => $audio):
				$audios_array[] =
					array(
						'track' => $key + 1,
						'name' => $audio->audio_name,
						'disk' => $audio->disk,
						'file' => $audio->original,
					);
			endforeach;
			if (!isset($audios_array)):
				$audios_array[] = array();
			endif;
		else:
			$audios_array[] = array();
		endif;

		$tracks = json_encode($audios_array);
		$tracker = new VisitorTracker();
		$tracker->page_type = \App\Enums\VisitorPageType::PostDetailPage;
		$tracker->slug = $post->slug;
		$tracker->url = \Request::url();
		$tracker->source_url = \url()->previous();
		$tracker->ip = \Request()->ip();
		$tracker->date = date('Y-m-d');
		$tracker->agent_browser = UserAgentBrowser(\Request()->header('User-Agent'));
		$tracker->save();

//		dd($post);

		return view('site.pages.article_detail', compact('post', 'widgets', 'socialLinks', 'relatedPost', 'tracks', 'post_contents'));
	}

    public function mobileArticleDetail($id)
    {
        $post = Post::with('image')->whereId($id)->first();

        $post->total_hit = $post->total_hit+1;
        $post->timestamps = false;

        $post->save();

        // additional content
        $post_contents = [];
        if(!blank($post->contents)):
            foreach($post->contents as $key=>$content){
                $content_type = array_keys($content);
                //$post_contents[] = $type[0];
                foreach($content as $value){

                    $abc = [];
                    foreach($value as $key => $item){

                        if($key == 'image_id' && $key != ""){
                            $image = galleryImage::find($item);
                            $abc[] = [$key => $item, 'image' => $image];
                        }elseif($key == 'video_thumbnail_id' && $key != ""){
                            $image = galleryImage::find($item);
                            $abc[] = [$key => $item, 'video_thumbnail' => $image];
                        }elseif($key == 'video_id' && $key != ""){
                            $video = Video::find($item);
                            $abc[] = [$key => $item, 'video' => $video];

                        }elseif($key == 'ads' && $key != ""){

                            $ads_info = Ad::find($item);

                            if($ads_info->ad_type == 'image'){

                                $detail = galleryImage::find($ads_info->ad_image_id);

                            }elseif($ads_info->ad_type == 'code'){

                                $detail = $ads_info->ad_code;

                            }elseif($ads_info->ad_type == 'text'){

                                $detail = $ads_info->ad_text;
                            }

                            $abc[] = [$key => $item, 'ads_type' => $ads_info->ad_type, 'detail' => $detail];
                        }else{
                            $abc[] = [$key => $item];
                        }
                    }
                    $post_contents[] =[$content_type[0] => $abc];
                }
            }
        endif;

        if ($post->post_type == "audio"):
            foreach ($post->audio as $key => $audio):
                $audios_array[] =
                    array(
                        'track' => $key + 1,
                        'name' => $audio->audio_name,
                        'disk' => $audio->disk,
                        'file' => $audio->original,
                    );
            endforeach;
            if (!isset($audios_array)):
                $audios_array[] = array();
            endif;
        else:
            $audios_array[] = array();
        endif;

        $tracks = json_encode($audios_array);
        $tracker = new VisitorTracker();
        $tracker->page_type = \App\Enums\VisitorPageType::PostDetailPage;
        $tracker->slug = $post->slug;
        $tracker->url = \Request::url();
        $tracker->source_url = \url()->previous();
        $tracker->ip = \Request()->ip();
        $tracker->date = date('Y-m-d');
        $tracker->agent_browser = UserAgentBrowser(\Request()->header('User-Agent'));
        $tracker->save();

        return view('site.pages.article.article_detail_mobile', compact('post', 'tracks', 'post_contents'));
    }

	private function socialLinks()
	{
		$socialLinkTitle = [
			'fb_url',
			'twitter_url',
			'google_url',
			'instagram_url',
			'pinterest_url',
			'linkedin_url',
			'youtube_url',
		];

		return Setting::whereIn('title', $socialLinkTitle)->get()->pluck('value', 'title');
	}

	public function submitNewsForm()
	{
		if (settingHelper('submit_news_status') == 1):
			if (!Sentinel::check()):
				return redirect()->route('site.login.form');
			endif;

			$widgetService = new WidgetService();
			$widgets = $widgetService->getWidgetDetails();

			return view('site.pages.submit_news', compact('widgets'));
		else:
			return response()->view('site.pages.404');
		endif;
	}

	//compressing image to and making webp
	public function compressImage($image, $type)
	{
		if ($type):
			$newImage = imagecreatefromjpeg($image);
			imagepalettetotruecolor($newImage);
			imagealphablending($newImage, true);
			imagesavealpha($newImage, true);
			imagewebp($newImage, $image, 80);
			return $newImage;
			imagedestroy($newImage);
		endif;
	}

	public function saveNews(Request $request)
	{
		if (settingHelper('submit_news_status') != 1):
			return response()->view('site.pages.404');
		endif;

		Validator::make($request->all(), [
			'title' => 'required|min:2|unique:posts',
			'content' => 'required',
			'image' => 'required|mimes:jpg,JPG,JPEG,jpeg,png|max:5120'
		])->validate();

		try {

			DB::beginTransaction();
			$post = new Post();
			$post->title = $request->get('title');
			$post->slug = $this->make_slug($request->title);
			$post->user_id = Sentinel::getUser()->id;
			$post->content = $request->get('content');
			$post->post_type = 'article';
			$post->submitted = 1;
			$post->language = app()->getLocale();

			if ($request->hasFile('image')):
				$post->image_id = $this->imageUpload($request);
			endif;

			$post->save();

			DB::commit();

			return redirect()->back()->with('success', __('successfully_added'));
		} catch (\Exception $e) {

			DB::rollBack();

			return view('site.pages.500');
		}
	}

	private function make_slug($string, $delimiter = '-') {

        $string = preg_replace("/[~`{}.'\"\!\@\#\$\%\^\&\*\(\)\_\=\+\/\?\>\<\,\[\]\:\;\|\\\]/", "", $string);

        $string = preg_replace("/[\/_|+ -]+/", $delimiter, $string);
        $result = mb_strtolower($string);

        if ($result):
            return $result;
        else:
            return $string;
        endif;
    }

	public function imageUpload($request)
	{
		$validation = Validator::make($request->all(), [
			'image' => 'required|mimes:jpg,JPG,JPEG,jpeg,png|max:5120',
		])->validate();

		try {
			$image = new galleryImage();
			$requestImage = $request->file('image');
			$fileType = $requestImage->getClientOriginalExtension();

			$originalImageName = date('YmdHis') . "_original_" . rand(1, 50) . '.' . 'webp';
			$ogImageName = date('YmdHis') . "_ogImage_" . rand(1, 50) . '.' . $fileType;
			$thumbnailImageName = date('YmdHis') . "_thumbnail_100x100_" . rand(1, 50) . '.' . 'webp';
			$bigImageName = date('YmdHis') . "_big_1080x1000_" . rand(1, 50) . '.' . 'webp';
			$bigImageNameTwo = date('YmdHis') . "_big_730x400_" . rand(1, 50) . '.' . 'webp';
			$mediumImageName = date('YmdHis') . "_medium_358x215_" . rand(1, 50) . '.' . 'webp';
			$mediumImageNameTwo = date('YmdHis') . "_medium_350x190_" . rand(1, 50) . '.' . 'webp';
			$mediumImageNameThree = date('YmdHis') . "_medium_255x175_" . rand(1, 50) . '.' . 'webp';
			$smallImageName = date('YmdHis') . "_small_123x83_" . rand(1, 50) . '.' . 'webp';


			if (strpos(php_sapi_name(), 'cli') !== false || settingHelper('default_storage') == 's3' || defined('LARAVEL_START_FROM_PUBLIC')) :
				$directory = 'images/';
			else:
				$directory = 'public/images/';
			endif;

			$originalImageUrl = $directory . $originalImageName;
			$ogImageUrl = $directory . $ogImageName;
			$thumbnailImageUrl = $directory . $thumbnailImageName;
			$bigImageUrl = $directory . $bigImageName;
			$bigImageUrlTwo = $directory . $bigImageNameTwo;
			$mediumImageUrl = $directory . $mediumImageName;
			$mediumImageUrlTwo = $directory . $mediumImageNameTwo;
			$mediumImageUrlThree = $directory . $mediumImageNameThree;
			$smallImageUrl = $directory . $smallImageName;


			if (settingHelper('default_storage') == 's3'):

				//ogImage
				$imgOg = Image::make($requestImage)->fit(730, 400)->stream();

				//jpg. jpeg, JPEG, JPG compression
				if ($fileType == 'jpeg' or $fileType == 'jpg' or $fileType == 'JPEG' or $fileType == 'JPG'):
					$imgOriginal = Image::make(imagecreatefromjpeg($requestImage))->encode('webp', 80);
					$imgThumbnail = Image::make(imagecreatefromjpeg($requestImage))->fit(100, 100)->encode('webp', 80);
					$imgBig = Image::make(imagecreatefromjpeg($requestImage))->fit(1080, 1000)->encode('webp', 80);
					$imgBigTwo = Image::make(imagecreatefromjpeg($requestImage))->fit(730, 400)->encode('webp', 80);
					$imgMedium = Image::make(imagecreatefromjpeg($requestImage))->fit(358, 215)->encode('webp', 80);
					$imgMediumTwo = Image::make(imagecreatefromjpeg($requestImage))->fit(350, 190)->encode('webp', 80);
					$imgMediumThree = Image::make(imagecreatefromjpeg($requestImage))->fit(255, 175)->encode('webp', 80);
					$imgSmall = Image::make(imagecreatefromjpeg($requestImage))->fit(123, 83)->encode('webp', 80);

				//png compression
				elseif ($fileType == 'PNG' or $fileType == 'png'):

					$imgOriginal = Image::make(imagecreatefrompng($requestImage))->encode('webp', 80);
					$imgThumbnail = Image::make(imagecreatefrompng($requestImage))->fit(100, 100)->encode('webp', 80);
					$imgBig = Image::make(imagecreatefrompng($requestImage))->fit(1080, 1000)->encode('webp', 80);
					$imgBigTwo = Image::make(imagecreatefrompng($requestImage))->fit(730, 400)->encode('webp', 80);
					$imgMedium = Image::make(imagecreatefrompng($requestImage))->fit(358, 215)->encode('webp', 80);
					$imgMediumTwo = Image::make(imagecreatefrompng($requestImage))->fit(350, 190)->encode('webp', 80);
					$imgMediumThree = Image::make(imagecreatefrompng($requestImage))->fit(255, 175)->encode('webp', 80);
					$imgSmall = Image::make(imagecreatefrompng($requestImage))->fit(123, 83)->encode('webp', 80);

				endif;

				try {
					Storage::disk('s3')->put($originalImageUrl, $imgOriginal);
					Storage::disk('s3')->put($ogImageUrl, $imgOg);
					Storage::disk('s3')->put($thumbnailImageUrl, $imgThumbnail);
					Storage::disk('s3')->put($bigImageUrl, $imgBig);
					Storage::disk('s3')->put($bigImageUrlTwo, $imgBigTwo);
					Storage::disk('s3')->put($mediumImageUrl, $imgMedium);
					Storage::disk('s3')->put($mediumImageUrlTwo, $imgMediumTwo);
					Storage::disk('s3')->put($mediumImageUrlThree, $imgMediumThree);
					Storage::disk('s3')->put($smallImageUrl, $imgSmall);

				} catch (S3 $e) {
					$data['status'] = 'error';
					$data['message'] = $e->getMessage();
					return Response()->json($data);
				}
			elseif (settingHelper('default_storage') == 'local'):
				Image::make($requestImage)->fit(730, 400)->save($ogImageUrl);


				if ($fileType == 'jpeg' or $fileType == 'jpg' or $fileType == 'JPEG' or $fileType == 'JPG'):
					Image::make(imagecreatefromjpeg($requestImage))->save($originalImageUrl, 80);

					Image::make(imagecreatefromjpeg($requestImage))->fit(100, 100)->save($thumbnailImageUrl, 80);
					Image::make(imagecreatefromjpeg($requestImage))->fit(1080, 1000)->save($bigImageUrl, 80);
					Image::make(imagecreatefromjpeg($requestImage))->fit(730, 400)->save($bigImageUrlTwo, 80);
					Image::make(imagecreatefromjpeg($requestImage))->fit(358, 215)->save($mediumImageUrl, 80);
					Image::make(imagecreatefromjpeg($requestImage))->fit(350, 190)->save($mediumImageUrlTwo, 80);
					Image::make(imagecreatefromjpeg($requestImage))->fit(255, 175)->save($mediumImageUrlThree, 80);
					Image::make(imagecreatefromjpeg($requestImage))->fit(123, 83)->save($smallImageUrl, 80);

				elseif ($fileType == 'PNG' or $fileType == 'png'):
					Image::make(imagecreatefrompng($requestImage))->save($originalImageUrl, 80);

					Image::make(imagecreatefrompng($requestImage))->fit(100, 100)->save($thumbnailImageUrl, 80);
					Image::make(imagecreatefrompng($requestImage))->fit(1080, 1000)->save($bigImageUrl, 80);
					Image::make(imagecreatefrompng($requestImage))->fit(730, 400)->save($bigImageUrlTwo, 80);
					Image::make(imagecreatefrompng($requestImage))->fit(358, 215)->save($mediumImageUrl, 80);
					Image::make(imagecreatefrompng($requestImage))->fit(350, 190)->save($mediumImageUrlTwo, 80);
					Image::make(imagecreatefrompng($requestImage))->fit(255, 175)->save($mediumImageUrlThree, 80);
					Image::make(imagecreatefrompng($requestImage))->fit(123, 83)->save($smallImageUrl, 80);
				endif;
			endif;

			$image->original_image = str_replace("public/", "", $originalImageUrl);
			$image->og_image = str_replace("public/", "", $ogImageUrl);
			$image->thumbnail = str_replace("public/", "", $thumbnailImageUrl);
			$image->big_image = str_replace("public/", "", $bigImageUrl);
			$image->big_image_two = str_replace("public/", "", $bigImageUrlTwo);
			$image->medium_image = str_replace("public/", "", $mediumImageUrl);
			$image->medium_image_two = str_replace("public/", "", $mediumImageUrlTwo);
			$image->medium_image_three = str_replace("public/", "", $mediumImageUrlThree);
			$image->small_image = str_replace("public/", "", $smallImageUrl);

			$image->disk = settingHelper('default_storage');
			$image->save();
			$image = galleryImage::latest()->first();

			return $image->id;
		} catch (\Exception $e) {
			Log::error($e->getMessage());
			return null;
		}
	}

	//post by category

    public function search(Request $request)
    {
        try{
            $posts = Post::where(DB::raw('LOWER(title)'), 'like', '%' . strtolower($request->get('search')) . '%')
                ->when(Sentinel::check() == false, function ($query) {
                    $query->where('auth_required', 0);
                })
                ->limit(6)->get();

            $totalPostCount = Post::where(DB::raw('LOWER(title)'), 'like', '%' . strtolower($request->get('search')) . '%')
                ->when(Sentinel::check() == false, function ($query) {
                    $query->where('auth_required', 0);
                })->count();

            return view('site.pages.search', compact('posts','totalPostCount'));
        } catch (\Exception $e) {
            return view('site.pages.404');
        }
    }

	public function postByCategory($slug)
	{
		try {
			$id = Category::where('slug', $slug)->first()->id;
			$posts = Post::with(['image', 'user'])->where('category_id', $id)->where('visibility', 1)
				->where('status', 1)
				->when(Sentinel::check() == false, function ($query) {
					$query->where('auth_required', 0);
				})
				->orderBy('id', 'desc')
				->where('language', LaravelLocalization::setLocale() ?? settingHelper('default_language'))->limit(6)
				->get();

			$totalPostCount = Post::where('category_id', $id)->where('visibility', 1)
				->where('status', 1)
				->when(Sentinel::check() == false, function ($query) {
					$query->where('auth_required', 0);
				})
				->orderBy('id', 'desc')
				->where('language', LaravelLocalization::setLocale() ?? settingHelper('default_language'))
				->count();

			$widgetService = new WidgetService();
			$widgets = $widgetService->getWidgetDetails();

			//dd($relatedPost);

			$tracker = new VisitorTracker();
			$tracker->page_type = \App\Enums\VisitorPageType::PostByCategoryPage;
			$tracker->url = \Request::url();
			$tracker->source_url = \url()->previous();
			$tracker->ip = \Request()->ip();
			$tracker->agent_browser = UserAgentBrowser(\Request()->header('User-Agent'));
			$tracker->save();

			return view('site.pages.category_posts', compact('posts', 'widgets', 'totalPostCount', 'id'));
		} catch (\Exception $e) {
			return view('site.pages.404');
		}
	}

	//post by sub category

	public function getReadMorePostCategory(Request $request)
	{

		$skip = $request->last_id * 6;
		$postCount = Post::where('category_id', $request->category_id)->where('visibility', 1)
			->where('status', 1)
			->when(Sentinel::check() == false, function ($query) {
				$query->where('auth_required', 0);
			})
			->orderBy('id', 'desc')
			->where('language', LaravelLocalization::setLocale() ?? settingHelper('default_language'))
			->count();

		$hideReadMore = 0;
		if ($skip >= $postCount) {
			$hideReadMore = 1;
		}
		$posts = Post::with(['image', 'user'])->where('category_id', $request->category_id)->where('visibility', 1)
			->where('status', 1)
			->when(Sentinel::check() == false, function ($query) {
				$query->where('auth_required', 0);
			})
			->orderBy('id', 'desc')
			->where('language', LaravelLocalization::setLocale() ?? settingHelper('default_language'))->limit(6)->skip($skip)->get();

		$allPosts = [];
		foreach ($posts as $post) {
			$appendRow = '';
			$appendRow .= "<div class='sg-post medium-post-style-1'>";
			$appendRow .= "<div class='entry-header'>";
			$appendRow .= "<div class='entry-thumbnail'>";
			$appendRow .= "<a href=' " . route('article.detail', ['id' => $post->slug]) . "'>";

			if (isFileExist($post->image, $result = @$post->image->medium_image)) {
				$appendRow .= "<img  src=' " . basePath($post->image) . '/' . $result . " ' class='img-fluid'   alt='" . $post->title . "  '>";
			} else {
				$appendRow .= "<img src='" . static_asset('default-image/default-240x160.png') . " '  class='img-fluid'   alt='" . $post->title . "' >";
			}
			$appendRow .= "</a>";
			$appendRow .= "</div>";
			if ($post->post_type == "video"):
				$appendRow .= "<div class='video-icon large-block'>";
				$appendRow .= "<img src='" . static_asset('default-image/video-icon.svg') . " ' alt='video-icon' >";
				$appendRow .= "</div>";
			elseif ($post->post_type == "audio"):
				$appendRow .= "<div class='video-icon large-block'>";
				$appendRow .= "<img src='" . static_asset('default-image/audio-icon.svg') . " ' alt='audio-icon' >";
				$appendRow .= "</div>";
			endif;
//            $appendRow .= "<div class='category'>";
//            $appendRow .= "<ul class='global-list'>";
//            if ($post->category != "") :
//                $appendRow .= "<li><a href='" . url('category', $post->category->slug) . "'> " . $post->category->category_name . "</a></li>";
//            endif;
//            $appendRow .= "</ul>";
//            $appendRow .= "</div>";
			$appendRow .= "</div>";
			$appendRow .= "<div class='entry-content align-self-center'>";
			$appendRow .= "<h3 class='entry-title'>";
			$appendRow .= "<a href=' " . route('article.detail', ['id' => $post->slug]) . " '> " . \Illuminate\Support\Str::limit($post->title, 60) . " ";
			$appendRow .= "</a>";
			$appendRow .= "</h3>";

			$appendRow .= "<div class='entry-meta mb-2'>";
			$appendRow .= "<ul class='global-list'>";
			$appendRow .= "<li> " . __('post_by') . " <a href='" . route('site.author', ['id' => $post->user->id]) . "'> " . data_get($post, 'user.first_name') . " </a></li>";
			$appendRow .= "<li><a href='" . route('article.date', date('Y-m-d', strtotime($post->updated_at))) . "'> " . $post->updated_at->format('F j, Y') . "</a></li>";
			$appendRow .= "</ul>";
			$appendRow .= "</div> ";
			$appendRow .= "<p>" . strip_tags(\Illuminate\Support\Str::limit($post->content, 150)) . "</p>";
			$appendRow .= "</div>";
			$appendRow .= "</div>";

			$allPosts[] = $appendRow;

		}
		return response()->json([$allPosts, $hideReadMore]);
	}

	public function postBySubCategory($slug)
	{
		try {
			$id = SubCategory::where('slug', $slug)->first()->id;

			$posts = Post::with(['image', 'user'])->where('sub_category_id', $id)->where('visibility', 1)
				->where('status', 1)
				->when(Sentinel::check() == false, function ($query) {
					$query->where('auth_required', 0);
				})
				->orderBy('id', 'desc')
				->where('language', LaravelLocalization::setLocale() ?? settingHelper('default_language'))->limit(6)
				->get();

			$totalPostCount = Post::where('sub_category_id', $id)->where('visibility', 1)
				->where('status', 1)
				->when(Sentinel::check() == false, function ($query) {
					$query->where('auth_required', 0);
				})
				->orderBy('id', 'desc')
				->where('language', LaravelLocalization::setLocale() ?? settingHelper('default_language'))
				->count();


			$widgetService = new WidgetService();
			$widgets = $widgetService->getWidgetDetails();

			//dd($relatedPost);

			$tracker = new VisitorTracker();
			$tracker->page_type = \App\Enums\VisitorPageType::PostBySubCategoryPage;
			$tracker->url = \Request::url();
			$tracker->source_url = \url()->previous();
			$tracker->ip = \Request()->ip();
			$tracker->agent_browser = UserAgentBrowser(\Request()->header('User-Agent'));
			$tracker->save();

			return view('site.pages.category_posts', compact('posts', 'widgets', 'totalPostCount', 'id'));
		} catch (\Exception $e) {
			return view('site.pages.404');
		}
	}

	//post by tags

	public function getPostSubcategory(Request $request)
	{

		$skip = $request->last_id * 6;
		$postCount = Post::where('sub_category_id', $request->sub_category_id)->where('visibility', 1)
			->where('status', 1)
			->when(Sentinel::check() == false, function ($query) {
				$query->where('auth_required', 0);
			})
			->orderBy('id', 'desc')
			->where('language', LaravelLocalization::setLocale() ?? settingHelper('default_language'))
			->count();

		$hideReadMore = 0;
		if ($skip >= $postCount) {
			$hideReadMore = 1;
		}
		$posts = Post::with(['image', 'user'])->where('sub_category_id', $request->sub_category_id)->where('visibility', 1)
			->where('status', 1)
			->when(Sentinel::check() == false, function ($query) {
				$query->where('auth_required', 0);
			})
			->orderBy('id', 'desc')
			->where('language', LaravelLocalization::setLocale() ?? settingHelper('default_language'))->limit(6)->skip($skip)
			->get();

		$allPosts = [];
		foreach ($posts as $post) {
			$appendRow = '';
			$appendRow .= "<div class='sg-post medium-post-style-1'>";
			$appendRow .= "<div class='entry-header'>";
			$appendRow .= "<div class='entry-thumbnail'>";
			$appendRow .= "<a href=' " . route('article.detail', ['id' => $post->slug]) . "'>";

			if (isFileExist($post->image, $result = @$post->image->medium_image)) {
				$appendRow .= "<img  src=' " . basePath($post->image) . '/' . $result . " ' class='img-fluid'   alt='" . $post->title . "  '>";
			} else {
				$appendRow .= "<img src='" . static_asset('default-image/default-240x160.png') . " '  class='img-fluid'   alt='" . $post->title . "' >";
			}
			$appendRow .= "</a>";
			$appendRow .= "</div>";
			if ($post->post_type == "video"):
				$appendRow .= "<div class='video-icon large-block'>";
				$appendRow .= "<img src='" . static_asset('default-image/video-icon.svg') . " ' alt='video-icon' >";
				$appendRow .= "</div>";
			elseif ($post->post_type == "audio"):
				$appendRow .= "<div class='video-icon large-block'>";
				$appendRow .= "<img src='" . static_asset('default-image/audio-icon.svg') . " ' alt='audio-icon' >";
				$appendRow .= "</div>";
			endif;
			$appendRow .= "<div class='category'>";
			$appendRow .= "<ul class='global-list'>";
			if ($post->category != "") :
				$appendRow .= "<li><a href='" . url('category', $post->category->slug) . "'> " . $post->category->category_name . "</a></li>";
			endif;
			$appendRow .= "</div>";
			$appendRow .= "<div class='entry-content align-self-center'>";
			$appendRow .= "<h3 class='entry-title'>";
			$appendRow .= "<a href=' " . route('article.detail', ['id' => $post->slug]) . " '> " . \Illuminate\Support\Str::limit($post->title, 60) . " ";
			$appendRow .= "</a>";
			$appendRow .= "</h3>";

			$appendRow .= "<div class='entry-meta mb-2'>";
			$appendRow .= "<ul class='global-list'>";
			$appendRow .= "<li> " . __('post_by') . " <a href='" . route('site.author', ['id' => $post->user->id]) . "'> " . data_get($post, 'user.first_name') . " </a></li>";
			$appendRow .= "<li><a href='" . route('article.date', date('Y-m-d', strtotime($post->updated_at))) . "'> " . $post->updated_at->format('F j, Y') . "</a></li>";
			$appendRow .= "</ul>";
			$appendRow .= "</div> ";
			$appendRow .= "<p>" . strip_tags(\Illuminate\Support\Str::limit($post->content, 150)) . "</p>";
			$appendRow .= "</div>";
			$appendRow .= "</div>";

			$allPosts[] = $appendRow;

		}
		return response()->json([$allPosts, $hideReadMore]);
	}

	public function postByTags($slug)
	{
		try {

			$posts = Post::with(['image', 'user'])->whereRaw("FIND_IN_SET('$slug',tags)")->where('visibility', 1)
				->where('status', 1)
				->when(Sentinel::check() == false, function ($query) {
					$query->where('auth_required', 0);
				})
				->orderBy('id', 'desc')
				->where('language', LaravelLocalization::setLocale() ?? settingHelper('default_language'))->limit(6)->get();

			$totalPostCount = Post::whereRaw("FIND_IN_SET('$slug',tags)")->where('visibility', 1)
				->where('status', 1)
				->when(Sentinel::check() == false, function ($query) {
					$query->where('auth_required', 0);
				})
				->orderBy('id', 'desc')
				->where('language', LaravelLocalization::setLocale() ?? settingHelper('default_language'))->count();


			$widgetService = new WidgetService();
			$widgets = $widgetService->getWidgetDetails();

			//dd($relatedPost);

			$tracker = new VisitorTracker();
			$tracker->page_type = \App\Enums\VisitorPageType::PostByTagsPage;
            $tracker->slug = $slug;
			$tracker->url = \Request::url();
			$tracker->source_url = \url()->previous();
			$tracker->ip = \Request()->ip();
			$tracker->agent_browser = UserAgentBrowser(\Request()->header('User-Agent'));
			$tracker->save();

			return view('site.pages.tags_posts', compact('posts', 'widgets', 'totalPostCount', 'slug'));
		} catch (\Exception $e) {
			return view('site.pages.404');
		}
	}

	//post by author

	public function getReadMorePostTags(Request $request)
	{

		$skip = $request->last_id * 6;
		$postCount = Post::where('tags', 'like', '%' . $request->tags . '%')->where('visibility', 1)
			->where('status', 1)
			->when(Sentinel::check() == false, function ($query) {
				$query->where('auth_required', 0);
			})
			->orderBy('id', 'desc')
			->where('language', LaravelLocalization::setLocale() ?? settingHelper('default_language'))->count();

		$hideReadMore = 0;
		if ($skip >= $postCount) {
			$hideReadMore = 1;
		}
		$posts = Post::with(['image', 'user'])->where('tags', 'like', '%' . $request->tags . '%')->where('visibility', 1)
			->where('status', 1)
			->when(Sentinel::check() == false, function ($query) {
				$query->where('auth_required', 0);
			})
			->orderBy('id', 'desc')
			->where('language', LaravelLocalization::setLocale() ?? settingHelper('default_language'))->limit(6)->skip($skip)->get();


		$allPosts = [];
		foreach ($posts as $post) {
			$appendRow = '';
			$appendRow .= "<div class='sg-post medium-post-style-1'>";
			$appendRow .= "<div class='entry-header'>";
			$appendRow .= "<div class='entry-thumbnail'>";
			$appendRow .= "<a href=' " . route('article.detail', ['id' => $post->slug]) . "'>";

			if (isFileExist($post->image, $result = @$post->image->medium_image)) {
				$appendRow .= "<img  src=' " . basePath($post->image) . '/' . $result . " ' class='img-fluid'   alt='" . $post->title . "  '>";
			} else {
				$appendRow .= "<img src='" . static_asset('default-image/default-240x160.png') . " '  class='img-fluid'   alt='" . $post->title . "' >";
			}
			$appendRow .= "</a>";
			$appendRow .= "</div>";
			if ($post->post_type == "video"):
				$appendRow .= "<div class='video-icon large-block'>";
				$appendRow .= "<img src='" . static_asset('default-image/video-icon.svg') . " ' alt='video-icon' >";
				$appendRow .= "</div>";
			elseif ($post->post_type == "audio"):
				$appendRow .= "<div class='video-icon large-block'>";
				$appendRow .= "<img src='" . static_asset('default-image/audio-icon.svg') . " ' alt='audio-icon' >";
				$appendRow .= "</div>";
			endif;
			$appendRow .= "<div class='category'>";
			$appendRow .= "<ul class='global-list'>";
			if ($post->category != "") :
				$appendRow .= "<li><a href='" . url('category', $post->category->slug) . "'> " . $post->category->category_name . "</a></li>";
			endif;
			$appendRow .= "</ul>";
			$appendRow .= "</div>";
			$appendRow .= "</div>";
			$appendRow .= "<div class='entry-content align-self-center'>";
			$appendRow .= "<h3 class='entry-title'>";
			$appendRow .= "<a href=' " . route('article.detail', ['id' => $post->slug]) . " '> " . \Illuminate\Support\Str::limit($post->title, 60) . " ";
			$appendRow .= "</a>";
			$appendRow .= "</h3>";

			$appendRow .= "<div class='entry-meta mb-2'>";
			$appendRow .= "<ul class='global-list'>";
			$appendRow .= "<li> " . __('post_by') . " <a href='" . route('site.author', ['id' => $post->user->id]) . "'> " . data_get($post, 'user.first_name') . " </a></li>";
			$appendRow .= "<li><a href='" . route('article.date', date('Y-m-d', strtotime($post->updated_at))) . "'> " . $post->updated_at->format('F j, Y') . "</a></li>";
			$appendRow .= "</ul>";
			$appendRow .= "</div> ";
			$appendRow .= "<p>" . strip_tags(\Illuminate\Support\Str::limit($post->content, 150)) . "</p>";
			$appendRow .= "</div>";
			$appendRow .= "</div>";

			$allPosts[] = $appendRow;
		}
		return response()->json([$allPosts, $hideReadMore]);

	}

	//post by author
	public function postByAuthor($id){
		try{
			$posts               =  Post::with(['image', 'user'])->where('user_id',$id)->where('visibility', 1)
								   ->where('status', 1)
								   ->when(Sentinel::check()== false, function ($query) {
									  $query->where('auth_required',0); })
								   ->orderBy('id', 'desc')
								   ->where('language', LaravelLocalization::setLocale() ?? settingHelper('default_language'))->paginate(10);

			$widgetService      = new WidgetService();
			$widgets            = $widgetService->getWidgetDetails();

			//dd($relatedPost);

			$tracker = new VisitorTracker();
			$tracker->page_type = \App\Enums\VisitorPageType::PostByAuthorPage;
			$tracker->url = \Request::url();
			$tracker->source_url = \url()->previous();
			$tracker->ip = \Request()->ip();
			$tracker->agent_browser = UserAgentBrowser(\Request()->header('User-Agent'));
			$tracker->save();

			return view('site.pages.category_posts', compact('posts', 'widgets'));
		} catch (\Exception $e) {
			return view('site.pages.404');
		}
	}

	//post by date
	public function postByDate($date){


		try{
			$posts          =  Post::with(['image', 'user'])->whereDate('updated_at', $date)
								->where('visibility', 1)
								->where('status', 1)
								->when(Sentinel::check()== false, function ($query) {
									$query->where('auth_required',0); })
								->orderBy('id', 'desc')
								->where('language', LaravelLocalization::setLocale() ?? settingHelper('default_language'))->limit(6)->get();


			$totalPostCount = Post::whereDate('updated_at', $date)
				->where('visibility', 1)
				->where('status', 1)
				->when(Sentinel::check() == false, function ($query) {
					$query->where('auth_required', 0);
				})
				->orderBy('id', 'desc')
				->where('language', LaravelLocalization::setLocale() ?? settingHelper('default_language'))->count();


			$widgetService = new WidgetService();
			$widgets = $widgetService->getWidgetDetails();

			//dd($relatedPost);

			$tracker = new VisitorTracker();
			$tracker->page_type = \App\Enums\VisitorPageType::PostByDatePage;
			$tracker->url = \Request::url();
			$tracker->source_url = \url()->previous();
			$tracker->ip = \Request()->ip();
			$tracker->agent_browser = UserAgentBrowser(\Request()->header('User-Agent'));
			$tracker->save();


			return view('site.pages.date_posts', compact('posts', 'widgets', 'totalPostCount', 'date'));
		} catch (\Exception $e) {
			return view('site.pages.404');
		}
	}

	public function getReadMorePostDate(Request $request)
	{
		$skip = $request->last_id * 6;

		$postCount = Post::whereDate('updated_at', $request->date)
			->where('visibility', 1)
			->where('status', 1)
			->when(Sentinel::check() == false, function ($query) {
				$query->where('auth_required', 0);
			})
			->where('language', LaravelLocalization::setLocale() ?? settingHelper('default_language'))->count();

		$hideReadMore = 0;
		if ($skip >= $postCount) {
			$hideReadMore = 1;
		}

		$posts = Post::with(['image', 'user', 'category'])->whereDate('updated_at', $request->date)
			->where('status', 1)
			->when(Sentinel::check() == false, function ($query) {
				$query->where('auth_required', 0);
			})
			->orderBy('id', 'desc')
			->limit(6)
			->skip($skip)
			->where('language', LaravelLocalization::setLocale() ?? settingHelper('default_language'))->get();


		$allPosts = [];
		foreach ($posts as $post) {
			$appendRow = '';
			$appendRow .= "<div class='sg-post medium-post-style-1'>";
			$appendRow .= "<div class='entry-header'>";
			$appendRow .= "<div class='entry-thumbnail'>";
			$appendRow .= "<a href=' " . route('article.detail', ['id' => $post->slug]) . "'>";

			if (isFileExist($post->image, $result = @$post->image->medium_image)) {
				$appendRow .= "<img  src=' " . basePath($post->image) . '/' . $result . " ' class='img-fluid'   alt='" . $post->title . "  '>";
			} else {
				$appendRow .= "<img src='" . static_asset('default-image/default-240x160.png') . " '  class='img-fluid'   alt='" . $post->title . "' >";
			}
			$appendRow .= "</a>";
			$appendRow .= "</div>";
			if ($post->post_type == "video"):
				$appendRow .= "<div class='video-icon large-block'>";
				$appendRow .= "<img src='" . static_asset('default-image/video-icon.svg') . " ' alt='video-icon' >";
				$appendRow .= "</div>";
			elseif ($post->post_type == "audio"):
				$appendRow .= "<div class='video-icon large-block'>";
				$appendRow .= "<img src='" . static_asset('default-image/audio-icon.svg') . " ' alt='audio-icon' >";
				$appendRow .= "</div>";
			endif;
			$appendRow .= "<div class='category'>";
			$appendRow .= "<ul class='global-list'>";
			if ($post->category != "") :
				$appendRow .= "<li><a href='" . url('category', $post->category->slug) . "'> " . $post->category->category_name . "</a></li>";
			endif;
			$appendRow .= "</ul>";
			$appendRow .= "</div>";
			$appendRow .= "</div>";
			$appendRow .= "<div class='entry-content align-self-center'>";
			$appendRow .= "<h3 class='entry-title'>";
			$appendRow .= "<a href=' " . route('article.detail', ['id' => $post->slug]) . " '> " . \Illuminate\Support\Str::limit($post->title, 60) . " ";
			$appendRow .= "</a>";
			$appendRow .= "</h3>";

			$appendRow .= "<div class='entry-meta mb-2'>";
			$appendRow .= "<ul class='global-list'>";
			$appendRow .= "<li> " . __('post_by') . " <a href='" . route('site.author', ['id' => $post->user->id]) . "'> " . data_get($post, 'user.first_name') . " </a></li>";
			$appendRow .= "<li><a href='" . route('article.date', date('Y-m-d', strtotime($post->updated_at))) . "'> " . $post->updated_at->format('F j, Y') . "</a></li>";
			$appendRow .= "</ul>";
			$appendRow .= "</div> ";
			$appendRow .= "<p>" . strip_tags(\Illuminate\Support\Str::limit($post->content, 150)) . "</p>";
			$appendRow .= "</div>";
			$appendRow .= "</div>";

			$allPosts[] = $appendRow;
		}
		return response()->json([$allPosts, $hideReadMore]);
	}

	public function getReadMorePost(Request $request)
	{
		$skip = $request->last_id * 6;
		$postCount = Post::where('visibility', 1)
			->where('status', 1)
			->when(Sentinel::check() == false, function ($query) {
				$query->where('auth_required', 0);
			})
			->where('language', LaravelLocalization::setLocale() ?? settingHelper('default_language'))->count();
		$hideReadMore = 0;
		if ($skip >= $postCount) {
			$hideReadMore = 1;
		}
		$posts = Post::with(['image', 'user', 'category'])->where('visibility', 1)
			->where('status', 1)
			->when(Sentinel::check() == false, function ($query) {
				$query->where('auth_required', 0);
			})
			->orderBy('id', 'desc')
			->limit(6)
			->skip($skip)
			->where('language', LaravelLocalization::setLocale() ?? settingHelper('default_language'))->get();


		$allPosts = [];
		foreach ($posts as $post) {
			$appendRow = '';
			$appendRow .= "<div class='sg-post medium-post-style-1'>";
			$appendRow .= "<div class='entry-header'>";
			$appendRow .= "<div class='entry-thumbnail'>";
			$appendRow .= "<a href=' " . route('article.detail', ['id' => $post->slug]) . "'>";

			if (isFileExist($post->image, $result = @$post->image->medium_image)) {
				$appendRow .= "<img  src=' " . basePath($post->image) . '/' . $result . " ' class='img-fluid'   alt='" . $post->title . "  '>";
			} else {
				$appendRow .= "<img src='" . static_asset('default-image/default-240x160.png') . " '  class='img-fluid'   alt='" . $post->title . "' >";
			}
			$appendRow .= "</a>";
			$appendRow .= "</div>";
			if ($post->post_type == "video"):
				$appendRow .= "<div class='video-icon large-block'>";
				$appendRow .= "<img src='" . static_asset('default-image/video-icon.svg') . " ' alt='video-icon' >";
				$appendRow .= "</div>";
			elseif ($post->post_type == "audio"):
				$appendRow .= "<div class='video-icon large-block'>";
				$appendRow .= "<img src='" . static_asset('default-image/audio-icon.svg') . " ' alt='audio-icon' >";
				$appendRow .= "</div>";
			endif;
			$appendRow .= "<div class='category'>";
			$appendRow .= "<ul class='global-list'>";
			if ($post->category != "") :
				$appendRow .= "<li><a href='" . url('category', $post->category->slug) . "'> " . $post->category->category_name . "</a></li>";
			endif;
			$appendRow .= "</ul>";
			$appendRow .= "</div>";
			$appendRow .= "</div>";
			$appendRow .= "<div class='entry-content align-self-center'>";
			$appendRow .= "<h3 class='entry-title'>";
			$appendRow .= "<a href=' " . route('article.detail', ['id' => $post->slug]) . " '> " . \Illuminate\Support\Str::limit($post->title, 60) . " ";
			$appendRow .= "</a>";
			$appendRow .= "</h3>";

			$appendRow .= "<div class='entry-meta mb-2'>";
			$appendRow .= "<ul class='global-list'>";
			$appendRow .= "<li> " . __('post_by') . " <a href='" . route('site.author', ['id' => $post->user->id]) . "'> " . data_get($post, 'user.first_name') . " </a></li>";
			$appendRow .= "<li><a href='" . route('article.date', date('Y-m-d', strtotime($post->updated_at))) . "'> " . $post->updated_at->format('F j, Y') . "</a></li>";
			$appendRow .= "</ul>";
			$appendRow .= "</div> ";
			$appendRow .= "<p>" . strip_tags(\Illuminate\Support\Str::limit($post->content, 150)) . "</p>";
			$appendRow .= "</div>";
			$appendRow .= "</div>";

			$allPosts[] = $appendRow;
		}
		return response()->json([$allPosts, $hideReadMore]);
	}

	public function getReadMorePostProfile(Request $request)
	{
		$skip = $request->last_id_profile * 12;
		$author_id = $request->author_id;
		$postCount = Post::where('user_id', $author_id)->where('visibility', 1)
			->where('status', 1)
			->when(Sentinel::check() == false, function ($query) {
				$query->where('auth_required', 0);
			})
			->where('language', LaravelLocalization::setLocale() ?? settingHelper('default_language'))->count();
		$hideReadMore = 0;
		if ($skip >= $postCount) {
			$hideReadMore = 1;
		}
		$articles = Post::with(['image', 'user', 'category'])->where('visibility', 1)
			->where('status', 1)
			->when(Sentinel::check() == false, function ($query) {
				$query->where('auth_required', 0);
			})
			->orderBy('id', 'desc')
			->limit(12)
			->skip($skip)
			->where('language', LaravelLocalization::setLocale() ?? settingHelper('default_language'))->get();


		$allPosts = [];

		foreach ($articles as $post) {
			$appendRow = "<div class='col-lg-4'>";
			$appendRow .= "<div class='sg-post'>";
			$appendRow .= "<div class='entry-header'>";
			$appendRow .= "<div class='entry-thumbnail'>";
			$appendRow .= "<a href=' " . route('article.detail', ['id' => $post->slug]) . "'>";

			if (isFileExist($post->image, $result = @$post->image->medium_image)):

				$appendRow .= "<img  src=' " . basePath($post->image) . '/' . $result . " ' data-original=' " . basePath($post->image) . '/' . $result . " ' class='img-fluid'   alt='" . $post->title . "  '>";
			else:
				$appendRow .= "<img src='" . static_asset('default-image/default-358x215.png') . " '  class='img-fluid'   alt='" . $post->title . "' >";
			endif;

			$appendRow .= " </a>";
			$appendRow .= "</div>";
			$appendRow .= "<div class='category'>";
			$appendRow .= "<ul class='global-list'>";
			if ($post->category != "") :
				$appendRow .= "<li><a href='" . url('category', $post->category->slug) . "'> " . $post->category->category_name . "</a></li>";
			endif;
			$appendRow .= " </ul>";
			$appendRow .= "</div>";
			if ($post->post_type == "video"):
				$appendRow .= "<div class='video-icon large-block'>";
				$appendRow .= "<img src='" . static_asset('default-image/video-icon.svg') . " ' alt='video-icon' >";
				$appendRow .= "</div>";
			elseif ($post->post_type == "audio"):
				$appendRow .= "<div class='video-icon large-block'>";
				$appendRow .= "<img src='" . static_asset('default-image/audio-icon.svg') . " ' alt='audio-icon' >";
				$appendRow .= "</div>";
			endif;
			$appendRow .= "</div>";

			$appendRow .= "<div class='entry-content'>";
			$appendRow .= "<h3 class='entry-title'>";
			$appendRow .= "<a href=' " . route('article.detail', ['id' => $post->slug]) . " '> " . \Illuminate\Support\Str::limit($post->title, 50) . " ";
			$appendRow .= "</a>";
			$appendRow .= "</h3>";

			$appendRow .= "<div class='entry-meta mb-2'>";
			$appendRow .= "<ul class='global-list'>";
			$appendRow .= "<li> " . __('post_by') . " <a href='" . route('site.author', ['id' => $post->user->id]) . "'> " . data_get($post, 'user.first_name') . " </a></li>";
			$appendRow .= "<li><a href='" . route('article.date', date('Y-m-d', strtotime($post->updated_at))) . "'> " . $post->updated_at->format('F j, Y') . "</a></li>";
			$appendRow .= "</ul>";
			$appendRow .= "</div> ";
			$appendRow .= "<p>" . strip_tags(\Illuminate\Support\Str::limit($post->content, 130)) . "</p>";
			$appendRow .= "</div>";
			$appendRow .= "</div>";
			$appendRow .= "</div>";
			$allPosts[] = $appendRow;
		}

		return response()->json([$allPosts, $hideReadMore]);
	}

    public function getReadMorePostSearch(Request $request)
    {

        $skip = $request->last_id * 6;
        $postCount = Post::where('title', 'like', '%' . $request->search . '%')->where('visibility', 1)
            ->where('status', 1)
            ->when(Sentinel::check() == false, function ($query) {
                $query->where('auth_required', 0);
            })
            ->orderBy('id', 'desc')
            ->where('language', LaravelLocalization::setLocale() ?? settingHelper('default_language'))->count();

        $hideReadMore = 0;
        if ($skip >= $postCount) {
            $hideReadMore = 1;
        }
        $posts = Post::with(['image', 'user'])->where('title', 'like', '%' . $request->search . '%')->where('visibility', 1)
            ->where('status', 1)
            ->when(Sentinel::check() == false, function ($query) {
                $query->where('auth_required', 0);
            })
            ->orderBy('id', 'desc')
            ->where('language', LaravelLocalization::setLocale() ?? settingHelper('default_language'))->limit(6)->skip($skip)->get();


        $allPosts = [];
        foreach ($posts as $post) {
            $appendRow = '';
            $appendRow .= "<div class='sg-post medium-post-style-1'>";
            $appendRow .= "<div class='entry-header'>";
            $appendRow .= "<div class='entry-thumbnail'>";
            $appendRow .= "<a href=' " . route('article.detail', ['id' => $post->slug]) . "'>";

            if (isFileExist($post->image, $result = @$post->image->medium_image)) {
                $appendRow .= "<img  src=' " . basePath($post->image) . '/' . $result . " ' class='img-fluid'   alt='" . $post->title . "  '>";
            } else {
                $appendRow .= "<img src='" . static_asset('default-image/default-240x160.png') . " '  class='img-fluid'   alt='" . $post->title . "' >";
            }
            $appendRow .= "</a>";
            $appendRow .= "</div>";
            if ($post->post_type == "video"):
                $appendRow .= "<div class='video-icon large-block'>";
                $appendRow .= "<img src='" . static_asset('default-image/video-icon.svg') . " ' alt='video-icon' >";
                $appendRow .= "</div>";
            elseif ($post->post_type == "audio"):
                $appendRow .= "<div class='video-icon large-block'>";
                $appendRow .= "<img src='" . static_asset('default-image/audio-icon.svg') . " ' alt='audio-icon' >";
                $appendRow .= "</div>";
            endif;
            $appendRow .= "<div class='category'>";
            $appendRow .= "<ul class='global-list'>";
            if ($post->category != "") :
                $appendRow .= "<li><a href='" . url('category', $post->category->slug) . "'> " . $post->category->category_name . "</a></li>";
            endif;
            $appendRow .= "</ul>";
            $appendRow .= "</div>";
            $appendRow .= "</div>";
            $appendRow .= "<div class='entry-content align-self-center'>";
            $appendRow .= "<h3 class='entry-title'>";
            $appendRow .= "<a href=' " . route('article.detail', ['id' => $post->slug]) . " '> " . \Illuminate\Support\Str::limit($post->title, 60) . " ";
            $appendRow .= "</a>";
            $appendRow .= "</h3>";

            $appendRow .= "<div class='entry-meta mb-2'>";
            $appendRow .= "<ul class='global-list'>";
            $appendRow .= "<li> " . __('post_by') . " <a href='" . route('site.author', ['id' => $post->user->id]) . "'> " . data_get($post, 'user.first_name') . " </a></li>";
            $appendRow .= "<li><a href='" . route('article.date', date('Y-m-d', strtotime($post->updated_at))) . "'> " . $post->updated_at->format('F j, Y') . "</a></li>";
            $appendRow .= "</ul>";
            $appendRow .= "</div> ";
            $appendRow .= "<p>" . strip_tags(\Illuminate\Support\Str::limit($post->content, 150)) . "</p>";
            $appendRow .= "</div>";
            $appendRow .= "</div>";

            $allPosts[] = $appendRow;
        }
        return response()->json([$allPosts, $hideReadMore]);

    }

}
