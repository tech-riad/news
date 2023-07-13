<div class="entry-header">
    <div class="entry-thumbnail">
        <a href="{{ route('article.detail', ['id' => $post->slug]) }}">
            @if(isFileExist(@$post->image, $result = @$post->image->big_image))
                <img src="{{ safari_check() ? basePath(@$post->image).'/'.$result : static_asset('default-image/default-1080x1000.png') }} "
                     data-original=" {{basePath($post->image)}}/{{ $result }} "
                     class="img-fluid" alt="{!! $post->title !!}">
            @else
                <img src="{{static_asset('default-image/default-1080x1000.png') }} " class="img-fluid"
                     alt="{!! $post->title !!}">
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
