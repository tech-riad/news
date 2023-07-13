@php
    //$posts = data_get($categorySection, 'category.post', collect([]));
    $topPosts = $posts->take(2);
    $bottomPosts = $posts->skip(2)->take(6);
@endphp


<div class="sg-section">
    <div class="section-content">
        <div class="section-title">
            <h1>
                @if(data_get($categorySection, 'label') == 'videos')
                    {{__('videos')}}
                @else
                    {{ \Illuminate\Support\Str::upper(data_get($categorySection, 'label')) }}
                @endif
            </h1>
        </div>
        <div class="row">
            @foreach($topPosts as $firstPost)
                <div class="col-lg-6">
                    <div class="sg-post">
                        @include('site.partials.home.category.first_post')
                        <div class="entry-content">
                            <h3 class="entry-title"><a
                                    href="#">{!! \Illuminate\Support\Str::limit($firstPost->title, 50) !!}</a></h3>
                            <div class="entry-meta mb-2">
                                <ul class="global-list">
                                    <li>{{ __('post_by') }} <a href="{{ route('site.author',['id' => $firstPost->user->id]) }}">{{ data_get($firstPost, 'user.first_name') }}</a></li>
                                </ul>
                            </div>
                            <p>{!! strip_tags(\Illuminate\Support\Str::limit($firstPost->content, 120)) !!}</p>
                        </div>
                    </div>
                </div>
            @endforeach

            @foreach($bottomPosts->chunk(3) as $postGroup)
                <div class="col-lg-6">
                    @foreach($postGroup as $post)
                        <div class="sg-post small-post post-style-1">
                            @include('site.partials.home.category.post_block')
                            <div class="entry-content">
                                <a href="{{ route('article.detail', ['id' => $post->slug]) }}"><p>{!! \Illuminate\Support\Str::limit($post->title, 25) !!}</p></a>
                                <div class="entry-meta">
                                    <ul class="global-list">
                                        <li>{{ __('post_by') }} <a href="{{ route('site.author',['id' => $post->user->id]) }}">{{ data_get($post, 'user.first_name') }}</a></li>
                                        <li><a href="{{route('article.date', date('Y-m-d', strtotime($post->updated_at)))}}"> {{ $post->updated_at->format('F j, Y') }}</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            @endforeach

        </div>
    </div>
</div>
