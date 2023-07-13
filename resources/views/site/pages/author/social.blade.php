@extends('site.layouts.app')
@section('author-socials')
    active
@endsection
@section('content')
    <div class="author-section">
        <div class="container">
            <div class="row">
                @include('site.pages.author.sidebar')
                <div class="col-md-8">
                    <form class="author-form author-form-content" name="author-form" method="post" action="{{ route('site.author.socials.update') }}">
                    @csrf
                        <div class="form-group text-left mb-0">
                            <label>{{ __('facebook_url') }}</label>
                            <input type="text" class="form-control" name="facebook_url" value="{{ @$socials['facebook_url'] }}"  placeholder="https://www.facebook.com">
                        </div>
                        <div class="form-group text-left mb-0">
                            <label>{{ __('twitter_url') }}</label>
                            <input type="text" class="form-control" name="twitter_url" value="{{ @$socials['twitter_url'] }}" placeholder="https://www.twitter.com">
                        </div>
                        <div class="form-group text-left mb-0">
                            <label>{{ __('instagram_url') }}</label>
                            <input type="text" class="form-control" name="instagram_url" value="{{ @$socials['instagram_url'] }}" placeholder="https://www.instagram.com">
                        </div>
                        <div class="form-group text-left mb-0">
                            <label>{{ __('google_url') }}</label>
                            <input type="text" class="form-control" name="google_url" value="{{ @$socials['google_url'] }}" placeholder="https://myaccount.google.com/">
                        </div>
                        <div class="form-group text-left mb-0">
                            <label>{{ __('pinterest_url') }}</label>
                            <input type="text" class="form-control" name="pinterest_url" value="{{ @$socials['pinterest_url'] }}" placeholder="https://www.pinterest.com">
                        </div>
                        <div class="form-group text-left mb-0">
                            <label>{{ __('youtube_url') }}</label>
                            <input type="text" class="form-control" name="youtube_url" value="{{ @$socials['youtube_url'] }}" placeholder="https://www.youtube.com">
                        </div>
                        <div class="form-group text-left mb-0">
                            <label>{{ __('linkedin_url') }}</label>
                            <input type="text" class="form-control" name="linkedin_url" value="{{ @$socials['linkedin_url'] }}" placeholder="https://www.linkedin.com">
                        </div>
                        <button type="submit" class="btn btn-primary">{{ __('save') }}</button>
                    </form>
                </div>
            </div><!-- /.row -->
        </div><!-- /.container -->
    </div><!-- /.author-section -->
@endsection

