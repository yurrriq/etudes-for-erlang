%%% ============================================================== [ teeth.erl ]
%%% @doc Etudes for Erlang: 6-4
%%% @end
%%% ==================================================================== [ EOH ]
-module(teeth).

%% Public API.
-export([alert/1]).


%% Types.
-export_type([pocket_depth/0]).

-type pocket_depth() :: [0] |
                        [ non_neg_integer() ].
%% The depth in millimeters of a pocket, i.e. six measurements around a tooth.
%% If tooth is missing, `[0]'.


-include("etudes_util.hrl").


%%% ============================================== [ Etude 6-4: Lists of Lists ]

%% @doc Given a list of `PocketDepths', return the list of `ProblemTeeth'.
-spec alert(PocketDepths) -> ProblemTeeth when
      PocketDepths :: [pocket_depth()],
      ProblemTeeth :: [non_neg_integer()].
alert(PocketDepths) ->
    {_, NeedAttention} = lists:foldl(fun do_alert/2, {1, []}, PocketDepths),
    lists:reverse(NeedAttention).

%% @hidden
-spec do_alert(Measurements, {ToothNumber, ProblemTeeth}) ->
                      {NextToothNumber, NewProblemTeeth} when
      Measurements    :: pocket_depth(),
      ToothNumber     :: non_neg_integer(),
      ProblemTeeth    :: [non_neg_integer()],
      NextToothNumber :: non_neg_integer(),
      NewProblemTeeth :: [non_neg_integer()].
do_alert(Measurements, {ToothNumber, NeedAttention})
  when [] == Measurements; [0] == Measurements ->
    {ToothNumber + 1, NeedAttention};
do_alert([Measurement|_Measurements], {ToothNumber, NeedAttention})
  when Measurement >= 4 ->
    {ToothNumber + 1, [ToothNumber|NeedAttention]};
do_alert([_Measurement|Measurements], {ToothNumber, NeedAttention}) ->
    do_alert(Measurements, {ToothNumber, NeedAttention}).


-ifdef(TEST).

%% @hidden
alert_test_() ->
    ?TEST_ETUDE(fun alert/1,
                "alert(~w) = ~w",
                [{[9,11,25,26,29],
                  [[[0], [2,2,1,2,2,1], [3,1,2,3,2,3],
                    [3,1,3,2,1,2], [3,2,3,2,2,1], [2,3,1,2,1,1],
                    [3,1,3,2,3,2], [3,3,2,1,3,1], [4,3,3,2,3,3],
                    [3,1,1,3,2,2], [4,3,4,3,2,3], [2,3,1,3,2,2],
                    [1,2,1,1,3,2], [1,2,2,3,2,3], [1,3,2,1,3,3], [0],
                    [3,2,3,1,1,2], [2,2,1,1,3,2], [2,1,1,1,1,2],
                    [3,3,2,1,1,3], [3,1,3,2,3,2], [3,3,1,2,3,3],
                    [1,2,2,3,3,3], [2,2,3,2,3,3], [2,2,2,4,3,4],
                    [3,4,3,3,3,4], [1,1,2,3,1,2], [2,2,3,2,1,3],
                    [3,4,2,4,4,3], [3,3,2,1,2,3], [2,2,2,2,3,3],
                    [3,2,3,2,3,2]]]}]).

-endif.


%%% ==================================================================== [ EOF ]
