@isset($quizResult)
    <div class="quiz-result">
        <h3>{!! $quizResult->result_title !!} </h3>

        @if(isFileExist(@$quizResult->image, $result = @$quizResult->image->og_image))
            <img class="img-fluid"
                 src="{{basePath(@$quizResult->image) }}/{{ $result }}"
                 alt="{!! $quizResult->result_title !!}">

        @endif

        {!! $quizResult->description !!}
    </div>
@endisset
