@php
    //$posts = data_get($categorySection, 'category.post', collect([]));
@endphp

<div class="sg-section">
    <div class="section-content mt-3">
        <div class="section-title">
            <h1>
                @if(data_get($categorySection, 'label') == 'videos')
                    {{__('videos')}}
                @else
                    {{ \Illuminate\Support\Str::upper(data_get($categorySection, 'label')) }}
                @endif
            </h1>
        </div>
        <div class="row">
            @foreach($posts->take(3) as $post)
                <div class="col-lg-4">
                    <div class="sg-post">
                        <div class="entry-header">
                            <div class="entry-thumbnail">
                                <a href="{{ route('article.detail', ['id' => $post->slug]) }}">
                                    @if(isFileExist(@$post->image, $result = @$post->image->medium_image))
                                        <img src="{{ safari_check() ? basePath(@$post->image).'/'.$result : static_asset('default-image/default-358x215.png')  }} "
                                             data-original=" {{basePath(@$post->image)}}/{{ $result }} "
                                             class="img-fluid lazy" alt="{!! $post->title !!}">
                                    @else
                                        <img src="{{ static_asset('default-image/default-358x215.png') }} "
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
                        </div>
                        <div class="entry-content">
                            <a href="{{ route('article.detail', ['id' => $post->slug]) }}">
                                <p>{!! \Illuminate\Support\Str::limit($post->title, 50) !!}</p></a>
                            <div class="entry-meta">
                                <ul class="global-list">
                                    <li><a href="{{route('article.date', date('Y-m-d', strtotime($post->updated_at)))}}"> {{ $post->updated_at->format('F j, Y') }}</a></li>
                                </ul>
                            </div>
                        </div>

                    </div>
                </div>
            @endforeach
        </div>
    </div>
</div>
