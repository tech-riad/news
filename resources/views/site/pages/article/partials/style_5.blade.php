<div class="entry-header">
    <div class="entry-thumbnail" height="100%">

        @if($post->post_type=='video')
            @if($post->video_id != null)

                @if(isFileExist(@$post->videoThumbnail, @$post->videoThumbnail->big_image_two))

                    <video id='player_in' controls
                           poster="{{basePath($post->videoThumbnail)}}/{{ $post->videoThumbnail->big_image_two }} "
                           height="100%">
                @else
                    <video id='player_in' controls
                           poster="{{static_asset('default-image/default-730x400.png') }}" height="100%">
                @endif

                @if($post->video->v_144p==null and
                    $post->video->v_240p==null and
                    $post->video->v_360p==null and
                    $post->video->v_480p==null and
                    $post->video->v_720p==null and
                    $post->video->v_1080p==null
                )
                    <source src="{{ basePath($post->video) }}/{{ $post->video->original }}"
                            type="video/{{$post->video->video_type}}"/>

                @else
                    <?php $video_version = array('v_1080p', 'v_720p', 'v_480p', 'v_360p', 'v_240p', 'v_144p') ?>

                    @foreach($video_version as $version)
                        @if($post->video->$version !=null)
                            <source src="{{ basePath($post->video) }}/{{ $post->video->$version }}"
                                    size="{{ str_replace(array("v_1080p","v_720p","v_480p","v_360p","v_240p","v_144p"), array("1080", "720","576","480","360","240"), $version)}}"
                                    type="video/{{$post->video->video_type}}"/>
                        @endif
                    @endforeach
                @endif
                    </video>

                @else
                    @if($post->video_url_type == "youtube_url")
                        <div id="player_in" data-plyr-provider="youtube"
                             data-plyr-embed-id="{{get_id_youtube($post->video_url)}}" height="100%"></div>
                    @elseif($post->video_url_type == "mp4_url")
                        <video id="player_in" playsinline controls
                               data-poster="{{ basePath(@$post->image)}}/{{  @$post->image->big_image_two }}"
                               height="100%">
                            <source src="{{$post->video_url}}" type="video/mp4"/>
                        </video>
                    @else
                        <img class="img-fluid" src="{{static_asset('default-image/default-730x400.png') }} "
                             alt="{!! $post->title !!}">
                    @endif
                @endif
            @else
                @if(isFileExist(@$post->image, $result = @$post->image->big_image_two))
                    <img class="img-fluid"
                         src="{{safari_check() ? basePath(@$post->image).'/'.$result : static_asset('default-image/default-730x400.png') }} "
                         data-original="{{ basePath(@$post->image) }}/{{ $result }}"
                         alt="{!! $post->title !!}">
                @else
                    <img class="img-fluid" src="{{static_asset('default-image/default-730x400.png') }} "
                         alt="{!! $post->title !!}">
            @endif

        @endif
    </div>
</div>
