@if(!blank($widget['detail']->poll))
    <div class="sg-widget" id="{{$widget['detail']->poll->id}}">
        <h3 class="widget-title">{{ __('vote') }} / {{ __('poll') }}</h3>
        <p>{{ $widget['detail']->poll->question }}</p>
        <form action="{{ route('site.poll.store') }}" method="post">
            @csrf
            <input type="hidden" name="poll" value="{{ $widget['detail']->poll->id }}">
            @foreach($widget['detail']->poll->pollOptions as $option)
                <input type="radio" name="option" id="{{ $option->option }}" value="{{ $option->id }}">
                <label for="{{ $option->option }}">{{ $option->option }}</label>
            @endforeach

            <button class="btn btn-primary" type="submit">vote</button>
            <a href="#" class="show-result">{{__('view_results')}}</a>
        </form>

        <div class="progress-content d-none" id="poll-result-{{ $widget['detail']->poll->id }}">
            @foreach($widget['detail']->poll->pollOptions as $option)
                <span>{{ $option->option }}</span>
                <div class="progress">
                    @if($widget['detail']->poll->pollResults->count() != 0)
                        <div class="progress-bar" style="width:{{ round(@$option->pollresults->count() / @$widget['detail']->poll->pollResults->count() * 100) }}%">{{ round(@$option->pollresults->count() / @$widget['detail']->poll->pollResults->count() * 100) }}%</div>
                    @else
                        <div class="progress-bar" width="0%">0%</div>
                    @endif
                </div>
            @endforeach
        </div><!-- /.progress-content -->
    </div>
@endif

