<div class="row mb-4">
    <div class="col-lg-4">
        <div class="text">
            <p class="paragraph">{!!$content['text-image-text'][0]['text_1']!!} </p>
        </div>
    </div>
    <div class="col-lg-4">
        <div class="thumb">
            @if($content['text-image-text'][1]['image'] != "")
                @if(isFileExist($content['text-image-text'][1]['image'] , $result =  $content['text-image-text'][1]['image']->medium_image_three))
                    <img src="{{safari_check() ? basePath(@$content['text-image-text'][1]['image']).'/'.$result : static_asset('default-image/default-255x175.png') }} " data-original=" {{basePath($content['text-image-text'][1]['image'])}}/{{ $result }} " class="img-fluid"   alt="{!! $post->title !!}"  >
                @else
                    <img class="img-fluid" src="{{ static_asset('default-image/default-255x175.png') }}" alt="{!! $post->title !!}" >
                @endif
            @else
                <img class="img-fluid" src="{{ static_asset('default-image/default-255x175.png') }}" alt="{!! $post->title !!}" >
            @endif
        </div>
    </div>
    <div class="col-lg-4">
        <div class="text">
            <p class="paragraph">{!!$content['text-image-text'][2]['text_2']!!}</p>
        </div>
    </div>
</div>
