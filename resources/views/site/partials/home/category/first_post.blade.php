<div class="entry-header">
    <div class="entry-thumbnail">
        <a href="{{ route('article.detail', ['id' => @$firstPost->slug]) }}">
            @if(isFileExist(@$firstPost->image, $result =@$firstPost->image->medium_image))
                <img src="{{ safari_check() ? basePath(@$firstPost->image).'/'.$result : static_asset('default-image/default-358x215.png') }}"
                     data-original="{{basePath($firstPost->image)}}/{{ $result }}"
                     class="img-fluid" alt="{!! $firstPost->title !!}">
            @else
                <img src="{{static_asset('default-image/default-358x215.png') }}" class="img-fluid"
                     alt="{!! $firstPost->title !!}">
            @endif
        </a>
    </div>
    @if($firstPost->post_type=="video")
        <div class="video-icon large-block">
            <img src="{{static_asset('default-image/video-icon.svg') }}" alt="video-icon">
        </div>
    @elseif($firstPost->post_type=="audio")
        <div class="video-icon large-block">
            <img src="{{static_asset('default-image/audio-icon.svg') }}" alt="audio-icon">
        </div>
    @endif
</div>
