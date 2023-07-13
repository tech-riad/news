<div class="sg-inner-image m-2">

	@if(!blank($post_contents))
	@php
		$video_count = 99;
	@endphp
	    @foreach($post_contents as $key => $content)
	        @php
	       
	        $page = array_keys($content);
	        if($page[0] == 'video'){
	        	 $video_count++;
	        }

	        @endphp

	        @include('site.pages.article.partials.contents.'.$page[0], compact('content', 'video_count'))
	    @endforeach
    @endif

</div>
