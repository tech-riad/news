@extends('site.layouts.app')
@section('author-password')
    active
@endsection
@section('content')
    <div class="author-section">
        <div class="container">
            <div class="row">
                @include('site.pages.author.sidebar')
                <div class="col-md-8">
                    <form class="author-form author-form-content" name="author-form" method="post" action="{{ route('change-password-by-me') }}">
                        @csrf
                        <div class="form-group text-left mb-0">
                            <label>{{ __('old_password') }}</label>
                            <input type="password" name="old_password" class="form-control" required="required" placeholder="***********">
                        </div>
                        <div class="form-group text-left mb-0">
                            <label>{{ __('new_password') }}</label>
                            <input type="password" name="password" class="form-control" required="required" placeholder="***********">
                        </div>
                        <div class="form-group text-left mb-0">
                            <label>{{ __('confirm_password') }}</label>
                            <input type="password" name="password_confirmation" class="form-control" required="required" placeholder="***********">
                        </div>
                        <button type="submit" class="btn btn-primary">{{ __('save') }}</button>
                    {{ Form::close() }}
                </div>
            </div><!-- /.row -->
        </div><!-- /.container -->
    </div><!-- /.author-section -->
@endsection

