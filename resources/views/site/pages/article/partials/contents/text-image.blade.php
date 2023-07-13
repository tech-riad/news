<div class="row mb-4">
    <div class="col-lg-6">
        <div class="text">
            <p class="paragraph">{!!$content['text-image'][0]['text']!!} </p>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="thumb">
            @if($content['text-image'][1]['image'] != "")
                @if(isFileExist($content['text-image'][1]['image'] , $result =  $content['text-image'][1]['image']->medium_image))
                    <img src="{{safari_check() ? basePath(@$content['text-image'][1]['image']).'/'.$result : static_asset('default-image/default-358x215.png') }} " data-original=" {{basePath($content['text-image'][1]['image'])}}/{{ $result }} " class="img-fluid"   alt="{!! $post->title !!}"  >
                @else
                    <img class="img-fluid" src="{{ static_asset('default-image/default-358x215.png') }}" alt="{!! $post->title !!}" >
                @endif
            @else
                <img class="img-fluid" src="{{ static_asset('default-image/default-358x215.png') }}" alt="{!! $post->title !!}" >
            @endif
        </div>
    </div>
    
</div>