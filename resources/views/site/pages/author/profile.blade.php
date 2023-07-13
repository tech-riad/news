@extends('site.layouts.app')
@section('content')
    <div class="author-section">
        <div class="container">
            <div class="author-content">
                <div class="author-top-content d-md-flex">
                    <div class="author">
                        @if(@$author->profile_image != null)
                            <img src="{{static_asset('default-image/user.jpg') }}" data-original=" {{static_asset(@$author->profile_image)}}" id="profile-img" class="img-fluid"   >
                        @else
                            <img src="{{static_asset('default-image/user.jpg') }}"   id="profile-img" class="img-fluid">
                        @endif
                    </div>
                    <div class="author-info">
                        <h2>{{ $author->first_name.' '.$author->last_name }}</h2>
                        <div class="{{ Sentinel::check($author->id) ? "active":"away" }}">
                            <span>{{ __('last_login')}}: {{ date('l, d F Y, h:i a' , strtotime(Sentinel::findById($author->id)->last_login)) }}</span>
                        </div>
                        <p>{{ $author->about_us }}</p>
                        <div class="entry-meta">
                            <ul class="global-list">
                                <li><a href="#">{{ __('member_since') }} {{ $author->created_at->format('F j, Y') }}</a></li>
                                @if(@$author->permissions['email_show'] == 1)
                                    <li><i class="fa fa-envelope-o"></i><a href="mailto: {{ $author->email }}">{{ $author->email }}</a></li>
                                @endif
                            </ul>
                        </div><!-- /.entry-meta -->
                        <div class="sg-social">
                            <ul class="global-list d-flex">
                                @if(@$author->social_media['facebook_url'] != null)
                                    <li><a href="{{ @$author->social_media['facebook_url'] }}"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                @endif
                                @if(@$author->social_media['twitter_url'] != null)
                                    <li><a href="{{ @$author->social_media['twitter_url'] }}"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                @endif
                                @if(@$author->social_media['instagram_url'] != null)
                                    <li><a href="{{ @$author->social_media['instagram_url'] }}"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                @endif
                                @if(@$author->social_media['google_url'] != null)
                                    <li><a href="{{ @$author->social_media['google_url'] }}"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                                @endif
                                @if(@$author->social_media['pinterest_url'] != null)
                                    <li><a href="{{ @$author->social_media['pinterest_url'] }}"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                                @endif
                                @if(@$author->social_media['youtube_url'] != null)
                                    <li><a href="{{ @$author->social_media['youtube_url'] }}"><i class="fa fa-youtube" aria-hidden="true"></i></a></li>
                                @endif
                                @if(@$author->social_media['linkedin_url'] != null)
                                    <li><a href="{{ @$author->social_media['linkedin_url'] }}"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                @endif
                            </ul>
                        </div><!-- /.sg-social -->
                    </div>
                </div><!-- /.author-top-content -->
                <div class="row">
                    <div class="col-md-12">
                            <div class="row latest-post-area-profile">
                                @foreach($articles as $post)
                                    <div class="col-lg-4">
                                        <div class="sg-post">
                                            <div class="entry-header">
                                                <div class="entry-thumbnail">
                                                    <a href="{{ route('article.detail', ['id' => @$post->slug]) }}">
                                                        @if(isFileExist($post->image, $result =  @$post->image->medium_image))
                                                            <img src="{{safari_check() ? basePath(@$post->image).'/'.$result : static_asset('default-image/default-358x215.png') }} " data-original=" {{basePath($post->image)}}/{{ $result }} " class="img-fluid lazy"   alt="{!! $post->title !!}"  >
                                                        @else
                                                            <img src="{{static_asset('default-image/default-358x215.png') }} "  class="img-fluid"   alt="{!! $post->title !!}" >
                                                        @endif
                                                    </a>
                                                </div>
                                                <div class="category">
                                                    <ul class="global-list">
                                                        @isset($post->category->category_name)
                                                            <li><a href="{{ url('category',$post->category->slug) }}">{{ $post->category->category_name }}</a></li>
                                                        @endisset
                                                    </ul>
                                                </div>
                                                @if($post->post_type=="video")
                                                <div class="video-icon large-block">
                                                    <img src="{{static_asset('default-image/video-icon.svg') }} " alt="video-icon">
                                                </div>
                                                @elseif($post->post_type=="audio")
                                                    <div class="video-icon large-block">
                                                        <img src="{{static_asset('default-image/audio-icon.svg') }} " alt="audio-icon">
                                                    </div>
                                                @endif
                                            </div>
                                            <div class="entry-content">
                                                <h3 class="entry-title"><a href="{{ route('article.detail', ['id' => $post->slug]) }}"><p>{!! \Illuminate\Support\Str::limit($post->title, 50) !!}</p></a></h3>
                                                <div class="entry-meta mb-2">
                                                    <ul class="global-list">
                                                        <li>{{ __('post_by') }} <a href="{{ route('site.author',['id' => $post->user->id]) }}">{{ data_get($post, 'user.first_name') }}</a></li>
                                                        <li><a href="{{route('article.date', date('Y-m-d', strtotime($post->updated_at)))}}">{{ $post->updated_at->format('F j, Y') }}</a></li>
                                                    </ul>
                                                </div><!-- /.entry-meta -->
                                                <p> {!! strip_tags(\Illuminate\Support\Str::limit($post->content, 130)) !!}</p>
                                            </div><!-- /.entry-content -->
                                        </div><!-- /.sg-post -->
                                    </div>
                                @endforeach
                            </div><!-- /.more-post-area -->
                        @if($articles->count() != 0)
                            <input type="hidden" id="last_id_profile" value="1">
                            <input type="hidden" id="author_id" value="{{ $author->id }}">
                            <div class="col-sm-12 col-xs-12 d-none" id="latest-preloader-area-profile">
                                <div class="row latest-preloader">
                                    <div class="col-md-7 offset-md-5">
                                        <img src="{{static_asset('site/images/')}}/preloader-2.gif" alt="Image" class="tr-preloader img-fluid">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 col-xs-12">
                                <div class="row">

                                    <button class="btn-load-more {{ $totalPostCount > 12? '':'d-none'}}" id="btn-load-more-profile"> {{ __('load_more') }} </button>


                                    <button class="btn-load-more {{ $totalPostCount > 12? 'd-none':''}}" id="no-more-data-profile">
                                        {{ __('no_more_records') }}    </button>
                                    <input type="hidden" id="url" value="{{ url('') }}">

                                </div>
                            </div>
                        @endif
                    </div>
                </div>
            </div><!-- /.author-content -->
        </div><!-- /.container -->
    </div><!-- /.author-section -->

@endsection

