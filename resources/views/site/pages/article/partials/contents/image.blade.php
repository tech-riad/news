<div class="thumb mb-4">

	@if($content['image'][0]['image'] != "")
	    @if(isFileExist($content['image'][0]['image'] , $result =  $content['image'][0]['image']->big_image_two))
	        <img src="{{safari_check() ? basePath(@$content['image'][0]['image']).'/'.$result : static_asset('default-image/default-730x400.png') }} " data-original=" {{basePath($content['image'][0]['image'])}}/{{ $result }} " class="img-fluid"   alt="{!! $post->title !!}"  >
	    @else
	    	<img class="img-fluid" src="{{ static_asset('default-image/default-730x400.png') }}" alt="{!! $post->title !!}" >
	    @endif
    @else
    	<img class="img-fluid" src="{{ static_asset('default-image/default-730x400.png') }}" alt="{!! $post->title !!}" >
    @endif

</div>

