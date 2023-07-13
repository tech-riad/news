<div class="col-md-4">
    <h1>Settings</h1>
    <div class="author-menu">
        <ul class="global-list">
            <li><a class="@yield('my-profile-edit')" href="{{ route('site.profile.form') }}">{{ __('edit_profile') }}</a></li>
            <li><a class="@yield('author-socials')" href="{{ route('site.author.socials') }}">{{ __('socials') }}</a></li>
            <li><a class="@yield('author-preference')" href="{{ route('site.author.preference') }}">{{ __('preference_setting') }}</a></li>
            <li><a class="@yield('author-password')" href="{{ route('site.author.password') }}">{{ __('change_password') }}</a></li>
        </ul>
    </div>
</div>
