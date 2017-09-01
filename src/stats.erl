%%% ============================================================== [ stats.erl ]
%%% @doc Etudes for Erlang: 6-1, 6-2, 7-3
%%% @end
%%% ==================================================================== [ EOH ]
-module(stats).

%% Public API.
-export([minimum/1, maximum/1, range/1, mean/1, stdv/1]).


-include("etudes_util.hrl").


%%% ========================== [ Etude 6-1: Recursive Iteration through a List ]

%% @doc Return the smallest number in `Numbers'.
%% @equiv lists:min(Numbers)
-spec minimum(Numbers :: [number(),...]) -> Minimum :: number().
minimum([Head|Tail]) ->
    do_minimum(Tail, Head).


-ifdef(TEST).

%% @hidden
minimum_test_() ->
    ?TEST_ETUDE(fun minimum/1,
                "The minimum of ~p is ~p",
                [{-17, [[4,1,7,-17,8,2,5]]}]) ++
        [{<<"There does not exist a minimum of the empty list">>,
          ?_assertError(function_clause, minimum([]))}].

-endif.


%%% ===================================== [ Etude 6-2: Iteration through Lists ]

%% @doc Return the greatest number in `Numbers'.
%% @equiv lists:max(Numbers)
-spec maximum(Numbers :: [number(),...]) -> Maximum :: number().
maximum([Head|Tail]) ->
    do_maximum(Tail, Head).


-ifdef(TEST).

%% @hidden
maximum_test_() ->
    ?TEST_ETUDE(fun maximum/1,
                "The maximum of ~p is ~p",
                [{8, [[4,1,7,-17,8,2,5]]}]) ++
        [{<<"There does not exist a maximum of the empty list">>,
          ?_assertError(function_clause, maximum([]))}].

-endif.


%% @equiv {minimum(Numbers), maximum(Numbers)}
%% @see minimum/1
%% @see maximum/1
-spec range(Numbers) -> {Minimum, Maximum} when
      Numbers :: [number(), ...],
      Minimum :: number(),
      Maximum :: number().
range(Numbers) ->
    {minimum(Numbers), maximum(Numbers)}.


-ifdef(TEST).

%% @hidden
range_test_() ->
    ?TEST_ETUDE(fun range/1,
                "The range of ~p is ~p",
                [{{-17,8}, [[4,1,7,-17,8,2,5]]}]) ++
        [{<<"There does not exist a range of the empty list">>,
          ?_assertError(function_clause, range([]))}].

-endif.


%%% ========================================= [ Etude 7-3: Using lists:foldl/3 ]

%% @doc Compute the <em>mean</em> of a `List' of numbers.
%% @equiv lists:sum(List) / length(List)
-spec mean(List :: [number(),...]) -> Mean :: float().
mean(List) ->
    sum(List) / length(List).


-ifdef(TEST).

%% @hidden
mean_test_() ->
    ?TEST_ETUDE(fun mean/1,
                "The mean of ~p is ~p",
                [{6.0, [[7,2,9]]}]).

-endif.


%% @doc Compute the <em>standard derivation</em> of a `List' of numbers.
-spec stdv(List :: [number(),...]) -> StandardDeviation :: float().
stdv(List) ->
    N = length(List),
    {SumOfSquares, Sum} = lists:foldl(fun do_stdv/2, {0, 0}, List),
    math:sqrt(((N * SumOfSquares) - (Sum * Sum)) / (N * (N - 1))).


-ifdef(TEST).

%% @hidden
stdv_test_() ->
    ?TEST_ETUDE(fun stdv/1,
                "The standard deviation of ~p is ~p",
                [{3.605551275463989, [[7,2,9]]}]).

-endif.


%%% ========================================================== [ Private Parts ]

%% @doc Tail-recursive implementation of {@link minimum/1}.
-spec do_minimum(RemainingNumbers, Candidate) -> Minimum when
      RemainingNumbers :: [number()],
      Candidate        :: number(),
      Minimum          :: number().
do_minimum([], Minimum) ->
    Minimum;
do_minimum([NewCandidate|Tail], Candidate) when NewCandidate < Candidate ->
    do_minimum(Tail, NewCandidate);
do_minimum([_Head|Tail], Candidate) ->
    do_minimum(Tail, Candidate).


%% @doc Tail-recursive implementation of {@link maximum/1}.
-spec do_maximum(RemainingNumbers, Candidate) -> Maximum when
      RemainingNumbers :: [number()],
      Candidate        :: number(),
      Maximum          :: number().
do_maximum([], Maximum) ->
    Maximum;
do_maximum([NewCandidate|Tail], Candidate) when NewCandidate > Candidate ->
    do_maximum(Tail, NewCandidate);
do_maximum([_Head|Tail], Candidate) ->
    do_maximum(Tail, Candidate).


%% @hidden
%% @equiv lists:sum(Numbers)
sum(Numbers) ->
    lists:foldl(fun(Number, Sum) -> Sum + Number end, 0, Numbers).


%% @hidden
do_stdv(Number, {SumOfSquares, Sum}) ->
    {Number * Number + SumOfSquares, Sum + Number}.


%%% ==================================================================== [ EOF ]
