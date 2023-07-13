<div class="post-author">
    <div class="d-flex mb-3">
        <div class="thumb">
            @if(@$post->user->profile_image != null)
                <img src="{{static_asset('default-image/user.jpg') }}" data-original="{{static_asset(@$post->user->profile_image)}}" class="img-fluid"   >
            @else
                <img src="{{static_asset('site/images/others/author.png') }}" class="img-fluid">
            @endif
        </div>
        <div class="text">
            <h3>{{ @$post->user->first_name.' '.@$post->user->last_name}}</h3>
            <div class="sg-social">
                <ul class="global-list">
                    @if(@$post->user->social_media['facebook_url'] != null)
                        <li><a href="{{ @$post->user->social_media['facebook_url'] }}"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                    @endif
                    @if(@$post->user->social_media['twitter_url'] != null)
                        <li><a href="{{ @$post->user->social_media['twitter_url'] }}"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                    @endif
                    @if(@$post->user->social_media['instagram_url'] != null)
                        <li><a href="{{ @$post->user->social_media['instagram_url'] }}"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                    @endif
                    @if(@$post->user->social_media['google_url'] != null)
                        <li><a href="{{ @$post->user->social_media['google_url'] }}"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                    @endif
                    @if(@$post->user->social_media['pinterest_url'] != null)
                        <li><a href="{{ @$post->user->social_media['pinterest_url'] }}"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                    @endif
                    @if(@$post->user->social_media['youtube_url'] != null)
                        <li><a href="{{ @$post->user->social_media['youtube_url'] }}"><i class="fa fa-youtube" aria-hidden="true"></i></a></li>
                    @endif
                    @if(@$post->user->social_media['linkedin_url'] != null)
                        <li><a href="{{ @$post->user->social_media['linkedin_url'] }}"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                    @endif
                </ul>
            </div><!-- /.sg-social -->
        </div>
    </div>
</div><!-- /.post-author -->
