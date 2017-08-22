%%% ============================================================== [ stats.erl ]
%%% @doc Etudes for Erlang
%%% @end
%%% ==================================================================== [ EOH ]
-module(stats).

%% Public API.
-export([minimum/1]).


-include("etudes_util.hrl").


%%% ========================== [ Etude 6-1: Recursive Iteration through a List ]

minimum([Head|Tail]) ->
    do_minimum(Tail, Head).


-ifdef(TEST).

minimum_test_() ->
    ?TEST_ETUDE(fun minimum/1,
                "The minimum of ~p is ~p",
                [{-17, [[4,1,7,-17,8,2,5]]}]) ++
        [{<<"There does not exist a minimum of the empty list">>,
          ?_assertError(function_clause, minimum([]))}].

-endif.


%%% ========================================================== [ Private Parts ]

do_minimum([], Minimum) ->
    Minimum;
do_minimum([NewCandidate|Tail], Candidate) when NewCandidate < Candidate ->
    do_minimum(Tail, NewCandidate);
do_minimum([_Head|Tail], Candidate) ->
    do_minimum(Tail, Candidate).


%%% ==================================================================== [ EOF ]
