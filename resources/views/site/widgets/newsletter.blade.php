<div class="sg-widget">
    <h3 class="widget-title">{{ __('newsletter') }}</h3>
    <div class="widget-newsletter text-center">
        <div class="icon">
            <i class="fa fa-envelope-o" aria-hidden="true"></i>
        </div>
        <p>{{ __('newsletter_description') }}</p>

        <form action="{{ route('subscribe.newsletter') }}" class="tr-form" method="POST">
            @csrf
            <label for="news" class="d-none">Newsletter</label>
            <input name="email" id="news" type="email" class="form-control" placeholder="{{__('email_address')}}" required>
            <button type="submit"><i class="fa fa-paper-plane" aria-hidden="true"></i><span class="d-none">{{__('email_address')}}</span></button>
        </form>
    </div>
</div>
