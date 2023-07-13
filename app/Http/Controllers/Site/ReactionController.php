<?php

namespace App\Http\Controllers\site;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Modules\Post\Entities\Post;
use App\Reaction;
use Jenssegers\Agent\Agent;


class ReactionController extends Controller
{
    public function postReaction(Request $request)
    {

        
        $this->insertReaction($request->all());

        $reactions = Reaction::where('post_id', $request->id)->get();

        $data['reactions'] =  [];
        foreach ($reactions->groupBy('data_reaction') as $key => $reaction) {
            $data['reactions'][$key] = $reaction->count();
        }

        $data['total'] =  $reactions->count();
        $data['is_you'] =  Reaction::where('post_id', $request->id)->where('ip_address', \Request::ip())->first();

        return response()->json($data);
    }

    public function insertReaction($request)
    {

        $reaction = Reaction::where('post_id', $request['id'])->where('ip_address', \Request::ip())->first();
        if(blank($reaction)):
            $reaction = new Reaction();
            $reaction->post_id = $request['id'];
            $reaction->data_reaction = $request['data_reaction'];
            $reaction->ip_address = \Request::ip();
            $reaction->save();
        elseif($reaction->data_reaction != $request['data_reaction']):
            $reaction->data_reaction = $request['data_reaction'];
            $reaction->ip_address = \Request::ip();
            $reaction->save();
        else:
            $reaction->delete();
        endif;

        return true;

    }
}
