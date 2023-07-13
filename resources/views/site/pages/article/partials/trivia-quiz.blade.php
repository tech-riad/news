<div class="row my-3">
    <div class="container question-container">
        @foreach(@$post->quizQuestions as $key => $quizQuestion)
{{--            quiz-answered--}}
            <div class="trivia-quiz-question " id="quiz_question_{{ $quizQuestion->id }}" data-is-last="{{($quizQuestion == $post->quizQuestions->last()) ? '1' : '0' }} ">
                <h3 class="entry-title">{!! $key+1 .'. '. $quizQuestion->question ?? '' !!} </h3>
                <div class="entry-meta mb-2">
                    <div class="my-1">
                        <p>{!! $quizQuestion->description !!}</p>
                    </div>

                    @if($quizQuestion->answer_format == 'text')
                        @if(isFileExist(@$quizQuestion->image, $result = @$quizQuestion->image->big_image_two))
                            <img class="img-fluid"
                                 src="{{safari_check() ? basePath(@$quizQuestion->image).'/'.$result : static_asset('default-image/default-730x400.png') }} "
                                 data-original="{{ basePath(@$quizQuestion->image) }}/{{ $result }}"
                                 alt="{!! $quizQuestion->question !!}">
                        @else
                            <img class="img-fluid" src="{{static_asset('default-image/default-730x400.png') }} "
                                 alt="{!! $quizQuestion->question !!}">
                        @endif
                    @endif
                </div>

                <div class="row">
                    @foreach(@$quizQuestion->quizAnswers as $key => $quizAnswer)
                        @if($quizQuestion->answer_format != 'text')
                            <div class="answers mb-3 {{ ($quizQuestion->answer_format == 'small_image') ? 'col-md-4': 'col-md-6' }} col-sm-12 answer-type-image">
{{--                                wrong-answer correct-answer--}}
                                <div class="answer trivia-quiz-answer " id="question_answer_{{ $quizAnswer->id }}"  data-post-id="{{ $post->id }}" data-question-id="{{ $quizQuestion->id }}" data-answer-id="{{ $quizAnswer->id }}">
                                    <div class="answer-container">
                                        <div class="image-container">
                                            @if(isFileExist(@$quizAnswer->image, $result = @$quizAnswer->image->medium_image))
                                                <img class="img-fluid"
                                                     src="{{safari_check() ? basePath(@$quizAnswer->image).'/'.$result : static_asset('default-image/default-358x215.png') }} "
                                                     data-original="{{ basePath(@$quizAnswer->image) }}/{{ $result }}"
                                                     alt="{!! $quizAnswer->answer_text !!}">
                                            @else
                                                <img class="img-fluid" src="{{static_asset('default-image/default-358x215.png') }} "
                                                     alt="{!! $quizAnswer->answer_text !!}">
                                            @endif
                                        </div>
                                        <div class="image-bottom">
                                            <div class="answer-button">
                                                <i class="icon-circle-outline answer-icon"></i>
                                                <div class="answer-text">
                                                    {!! $quizAnswer->answer_text !!}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        @elseif($quizQuestion->answer_format == 'text')
                            <div class="answers mb-2  col-md-12 col-sm-12 answer-type-text">
{{--                                wrong-answer correct-answer--}}
                                <div class="answer trivia-quiz-answer " id="question_answer_{{ $quizAnswer->id }}"  data-post-id="{{ $post->id }}" data-question-id="{{ $quizQuestion->id }}" data-answer-id="{{ $quizAnswer->id }}">
                                    <div class="image-bottom p-2">
                                        <div class="answer-button">
                                            <i class="icon-circle-outline answer-icon"></i>
                                            <div class="answer-text">
                                                {!! $quizAnswer->answer_text !!}
                                            </div>.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endif
                    @endforeach

                    <div class="col-xs-12 col-sm-12">
                        <div class="quiz-answer-alert">
                            <div class="alert alert-success" role="alert">
                                <p class="text"><i class="icon-check"></i>&nbsp;&nbsp;{{__('correct_answer')}}</p>
                            </div>
                            <div class="alert alert-danger" role="alert">
                                <p class="text"><i class="icon-cross"></i>&nbsp;&nbsp;{{__('wrong_answer')}}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        @endforeach
        <div class="row">
        <div class="col-xs-12 col-sm-12">
            <div class="result-show d-none">
                <div class="result-count-container justify-content-between">
                    <div class="correct-answer-count">
                        {{__('correct_answer')}} : <span id="correct_answer"></span>
                    </div>
                    <div class="wrong-answer-count">
                        {{__('wrong_answer')}} : <span id="wrong_answer"></span>
                    </div>
                </div>
            </div>
            <div id="result_container"></div>
        </div>
        <div class="col-xs-12 col-sm-12 btn-play-again">
            <button type="button" class="btn btn-primary" onclick="parent.scrollTo(0,0); window.location.reload();"><i class="icon-refresh"></i> {{__('play_again')}}</button>
        </div>
    </div>
    </div>
</div>


@section('quiz')
    <script type="text/javascript" src="{{ static_asset('site/js/quiz-result.js')}}" type="text/javascript"></script>
    <script>
        $(document).ready(function () {
            get_quiz_answers('{{ $post->id }}');
            get_quiz_results('{{ $post->id  }}');
        });
    </script>

@endsection
