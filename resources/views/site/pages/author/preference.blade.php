
@extends('site.layouts.app')
@section('author-preference')
    active
@endsection
@section('content')
    <div class="author-section">
        <div class="container">
            <div class="row">
                @include('site.pages.author.sidebar')
                <div class="col-md-8">
                    <form action="{{route('site.author.preference.update')}}" method="post" class="radio-form author-form-content">
                        @csrf
                        <h3>{{ __('show_email_on_profile_page') }}</h3>
                        <div class="row mb-5">
                            <div class="col-6 col-md-4">
                                <input type="radio" name="email_show" id="yes" value="1" {{ @$preferences['email_show'] == 1? 'checked':"" }}>
                                <label for="yes">{{__('yes')}}</label>
                            </div>
                            <div class="col-6 col-md-4">
                                <input type="radio" name="email_show" id="no" value="0" {{ @$preferences['email_show'] == 0? 'checked':"" }}>
                                <label for="no"> {{__('no')}}</label>
                            </div>
                        </div>
                        <h3>{{ __('show_author_on_post_detail') }}</h3>
                        <div class="row mb-5">
                            <div class="col-6 col-md-4">
                                <input type="radio" name="author_show" id="enable" value="1" {{ @$preferences['author_show'] == 1? 'checked':"" }}>
                                <label for="enable">{{__('yes')}}</label>
                            </div>
                            <div class="col-6 col-md-4">
                                <input type="radio" name="author_show" id="disable" value="0" {{ @$preferences['author_show'] == 0? 'checked':"" }}>
                                <label for="disable"> {{__('no')}}</label>
                            </div>
                        </div>
                        <button class="btn btn-primary">Save Change</button>
                    </form>
                </div>
            </div><!-- /.row -->
        </div><!-- /.container -->
    </div><!-- /.author-section -->
@endsection

