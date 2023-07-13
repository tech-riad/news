<div class="row mb-4">
    <div class="col-lg-12">
        @if($content['ads'][0]['ads_type'] == 'image')
            <div class="thumb">
                @if(isFileExist($content['ads'][0]['detail'] , $result =  $content['ads'][0]['detail']->original_image))
                    <img src="{{safari_check() ? basePath(@$content['ads'][0]['detail']).'/'.$result : static_asset('default-image/default-ads.png') }} " data-original=" {{basePath($content['ads'][0]['detail'])}}/{{ $result }} " class="img-fluid"   alt="{!! $post->title !!}"  >
                @else
                    <img class="img-fluid" src="{{ static_asset('default-image/default-ads.png') }}" alt="{!! $post->title !!}" >
                @endif
            </div>
        @elseif($content['ads'][0]['ads_type'] == 'text')
            <div class="text">
                <p class="paragraph">{!!$content['image-text'][1]['text']!!} </p>
            </div>
        @elseif($content['ads'][0]['ads_type'] == 'code')
            {!! $content['vimeo-embed'][0]['vimeo'] !!}
        @endif
    </div>
    <div class="col-lg-12">

    </div>
    <div class="col-lg-12">

    </div>
</div>
