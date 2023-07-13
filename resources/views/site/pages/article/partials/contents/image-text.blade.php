<div class="row mb-4">
    <div class="col-lg-6">
        <div class="thumb">
            @if($content['image-text'][0]['image'] != "")
                @if(isFileExist($content['image-text'][0]['image'] , $result =  $content['image-text'][0]['image']->medium_image))
                    <img src="{{safari_check() ? basePath(@$content['image-text'][0]['image']).'/'.$result : static_asset('default-image/default-358x215.png') }} " data-original=" {{basePath($content['image-text'][0]['image'])}}/{{ $result }} " class="img-fluid"   alt="{!! $post->title !!}"  >
                @else
                    <img class="img-fluid" src="{{ static_asset('default-image/default-358x215.png') }}" alt="{!! $post->title !!}" >
                @endif
            @else
                <img class="img-fluid" src="{{ static_asset('default-image/default-358x215.png') }}" alt="{!! $post->title !!}" >
            @endif
        </div>
    </div>
    <div class="col-lg-6">
        <div class="text">
            <p class="paragraph">{!!$content['image-text'][1]['text']!!} </p>
        </div>
    </div>
</div>

