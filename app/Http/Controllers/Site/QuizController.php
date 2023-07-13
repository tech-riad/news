<?php

namespace App\Http\Controllers\Site;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Modules\Post\Entities\Post;
use Modules\Post\Entities\QuizQuestion;

class QuizController extends Controller
{
    public function getAnswerArray(Request $request){
        $post_id = $request->post_id;

        $questions = Post::find($post_id)->quizQuestions;

        $array_quiz_answers = array();

        if (!empty($questions)) :
            foreach ($questions as $key => $question):
                $correct_answer = $this->getCorrectAnswer($question->id);
                if (!empty($correct_answer)):
                    $item = array($question->id, $correct_answer->id);
                    array_push($array_quiz_answers, $item);
                endif;
            endforeach;
        endif;

        $result = 1;

        return response()->json([$result , $array_quiz_answers]);
    }

    public function getResultArray(Request $request){
        $post_id = $request->post_id;

        $quiz_post_results = Post::find($post_id)->quizResults;

        $quiz_results = array();

        if (!empty($quiz_post_results)):
            foreach ($quiz_post_results as $key => $quizResult):

                $html = view('site.pages.article.partials.contents.trivia-result', compact('quizResult'))->render();

                $item = array($quizResult->id, $quizResult->min_correct, $quizResult->max_correct, $html);

                array_push($quiz_results, $item);
            endforeach;
        endif;

        $result = 1;

        return response()->json([$result , $quiz_results]);
    }

    public function getCorrectAnswer($question_id){
        $questionAnswer = QuizQuestion::find($question_id)->quizAnswers->where('is_correct' , 1)->first();

        return $questionAnswer;
    }
}
