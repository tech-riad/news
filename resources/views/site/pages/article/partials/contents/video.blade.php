@php
$video              = $content['video'][0]['video'];
$video_url          = $content['video'][2]['video_url'];
$video_url_type     = $content['video'][1]['video_url_type'];
$videoThumbnail     = $content['video'][3]['video_thumbnail'];

@endphp
<style type="text/css">
    .entry-thumbnail video{
        width: 100%;
    }
</style>
<div class="thumb mb-4">
    <div class="entry-header">
        <div class="entry-thumbnail" height="100%">

            @if($content['video'][0]['video_id'] != null)

                    @if(isFileExist(@$videoThumbnail, @$videoThumbnail->big_image_two))

                        <video id='player_{{$video_count}}' controls
                            poster="{{basePath($videoThumbnail)}}/{{ $videoThumbnail->big_image_two }} "
                            height="100%">
                    @else
                        <video id='player_{{$video_count}}' controls
                            poster="{{static_asset('default-image/default-730x400.png') }}" height="100%">
                    @endif

                    @if($video->v_144p==null and
                        $video->v_240p==null and
                        $video->v_360p==null and
                        $video->v_480p==null and
                        $video->v_720p==null and
                        $video->v_1080p==null
                    )
                        <source src="{{ basePath($video) }}/{{ $video->original }}"
                                type="video/{{$video->video_type}}"/>

                    @else
                        <?php $video_version = array('v_1080p', 'v_720p', 'v_480p', 'v_360p', 'v_240p', 'v_144p') ?>

                        @foreach($video_version as $version)
                            @if($video->$version !=null)
                                <source src="{{ basePath($video) }}/{{ $video->$version }}"
                                        size="{{ str_replace(array("v_1080p","v_720p","v_480p","v_360p","v_240p","v_144p"), array("1080", "720","576","480","360","240"), $version)}}"
                                        type="video/{{$video->video_type}}"/>
                            @endif
                        @endforeach
                    @endif
                    </video>

                @else
                    @if($video_url_type == "youtube_url")
                        <div id="player_{{$video_count}}" data-plyr-provider="youtube"
                            data-plyr-embed-id="{{get_id_youtube($video_url)}}" height="100%"></div>
                    @elseif($video_url_type == "mp4_url")
                        <video id="player_{{$video_count}}" playsinline controls
                            data-poster="{{ basePath(@$post->image)}}/{{  @$post->image->big_image_two }}"
                            height="100%">
                            <source src="{{$video_url}}" type="video/mp4"/>
                        </video>
                    @else
                        <img class="img-fluid" src="{{static_asset('default-image/default-730x400.png') }} "
                            alt="{!! $post->title !!}">
                    @endif
                @endif
               
        </div>
    </div>
</div>

