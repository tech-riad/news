@php
    $blockPosts = $posts->take(4);
@endphp
<div class="sg-home-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div id="home-carousel" class="carousel slide slider-style-1" data-ride="carousel">
                    <div class="carousel-inner">
                        @foreach($sliderPosts as $post)
                            <div class="carousel-item @if($sliderPosts->first()->id == $post->id) active @endif">
                                <div class="sg-post featured-post style_1">
                                    <div class="entry-header">
                                        <div class="entry-thumbnail">
                                            <a href="{{ route('article.detail', ['id' => $post->slug]) }}">
                                                @if(isFileExist(@$post->image, $result = @$post->image->big_image_two))
                                                    <img src="{{ safari_check() ? basePath(@$post->image).'/'.$result : static_asset('default-image/default-730x400.png') }}"
                                                         data-original=" {{basePath($post->image)}}/{{ $result }} "
                                                         class="img-fluid image-thumb" alt="{!! $post->title !!}">
                                                @else
                                                    <img src="{{static_asset('default-image/default-730x400.png') }}"
                                                         class="img-fluid image-thumb" alt="{!! $post->title !!}">
                                                @endif
                                            </a>
                                        </div>
                                        @if($post->post_type=="video")
                                            <div class="video-icon">
                                                <img src="{{static_asset('default-image/video-icon.svg') }} " alt="video-icon">
                                            </div>
                                        @elseif($post->post_type=="audio")
                                            <div class="video-icon">
                                                <img src="{{static_asset('default-image/audio-icon.svg') }} " alt="audio-icon">
                                            </div>
                                        @endif
                                    </div>
                                    <div class="entry-content absolute text-center">
                                        <div class="category" data-animation="animated pulse">
                                            <ul class="global-list justify-content-center">
                                                @isset($post->category->category_name)
                                                    <li>
                                                        <a href="{{ url('category',$post->category->slug) }}">{{ $post->category->category_name }}</a>
                                                    </li>
                                                @endisset
                                            </ul>
                                        </div>
                                        <h2 class="entry-title" data-animation="animated pulse">
                                            <a href="{{ route('article.detail', ['id' => $post->slug]) }}">{!! $post->title !!}</a>
                                        </h2>
                                        <div class="entry-meta" data-animation="animated pulse">
                                            <ul class="global-list justify-content-center">
                                                <li>{{ __('post_by') }} <a
                                                        href="{{ route('site.author',['id' => $post->user->id]) }}"> {{ data_get($post, 'user.first_name') }}</a>
                                                </li>
                                                <li>
                                                    <a href="{{route('article.date', date('Y-m-d', strtotime($post->updated_at)))}}">{{ $post->updated_at->format('F j, Y') }}</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                    <a class="carousel-control-prev" href="#home-carousel" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">{{ __('previous') }}</span>
                    </a>
                    <a class="carousel-control-next" href="#home-carousel" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">{{ __('next') }}</span>
                    </a>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="sg-breaking-news">
                    <div class="section-title">
                        <h1>{{ __('breaking_news') }}</h1>
                    </div>
                    <div class="breaking-news-slider">
                        @foreach($breakingNewss as $post)
                            <div class="sg-post">
                                <div class="entry-content">
                                    <div class="category">
                                        <ul class="global-list">
                                            @isset($post->category->category_name)
                                                <li>
                                                    <a href="{{ url('category',$post->category->slug) }}">{{ $post->category->category_name }}</a>
                                                </li>
                                            @endisset
                                        </ul>
                                    </div>
                                    <h2 class="entry-title">
                                        <a href="{{ route('article.detail', ['id' => $post->slug]) }}">{!! \Illuminate\Support\Str::limit($post->title,100) !!}</a>
                                    </h2>
                                    <div class="entry-meta">
                                        <ul class="global-list">
                                            <li>
                                                <a href="javascript:void(0)">{{ Carbon\Carbon::parse($post->updated_at)->diffForHumans() }}</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            @foreach($blockPosts as $post)
                <div class="col-md-3">
                    <div class="sg-post">
                        <div class="entry-header">
                            <div class="entry-thumbnail">
                                <a href="{{ route('article.detail', ['id' => $post->slug]) }}">
                                    @if(isFileExist(@$post->image, @$post->image->medium_image))
                                        <img class="img-fluid"
                                             src="{{ safari_check() ? basePath(@$post->image).'/'.$result : static_asset('default-image/default-358x215.png') }} "
                                             data-original="{{basePath(@$post->image)}}/{{ $post->image->medium_image }}"
                                             alt="{!! $post->title !!}">
                                    @else
                                        <img src="{{static_asset('default-image/default-358x215.png') }} "
                                             class="img-fluid" alt="{!! $post->title !!}">
                                    @endif
                                </a>
                            </div>
                            @if($post->post_type=="video")
                                <div class="video-icon block">
                                    <img src="{{static_asset('default-image/video-icon.svg') }} " alt="video-icon">
                                </div>
                            @elseif($post->post_type=="audio")
                                <div class="video-icon block">
                                    <img src="{{static_asset('default-image/audio-icon.svg') }} " alt="audio-icon">
                                </div>
                            @endif
                            <div class="category">
                                <ul class="global-list">
                                    @isset($post->category->category_name)
                                        <li>
                                            <a href="{{ url('category',$post->category->slug) }}">{{ $post->category->category_name }}</a>
                                        </li>
                                    @endisset
                                </ul>
                            </div>
                        </div>
                        <div class="entry-content">
                            <a href="{{ route('article.detail', ['id' => $post->slug]) }}">
                                <p>{!! \Illuminate\Support\Str::limit($post->title, 50) !!}</p></a>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</div>
