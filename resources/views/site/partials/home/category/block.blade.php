<div class="entry-header">
    <div class="entry-thumbnail">
        <a href="{{ route('article.detail', ['id' => $post->slug]) }}">
            @if(isFileExist($post->image, $result = @$post->image->medium_image_three))
                <img src="{{ safari_check() ? basePath(@$post->image).'/'.$result : static_asset('default-image/default-123x83.png') }} "
                     data-original=" {{basePath($post->image)}}/{{ $result }} "
                     class="img-fluid lazy" width="100%" height="100%" alt="{!! $post->title !!}">
            @else
                <img src="{{static_asset('default-image/default-255x175.png') }} " class="img-fluid"
                     alt="{!! $post->title !!}">
            @endif
        </a>
    </div>
    @if($post->post_type=="video")
        <div class="video-icon small-block">
            <img src="{{static_asset('default-image/video-icon.svg') }} " alt="video-icon">
        </div>
    @elseif($post->post_type=="audio")
        <div class="video-icon small-block">
            <img src="{{static_asset('default-image/audio-icon.svg') }} " alt="audio-icon">
        </div>
    @endif
</div>
