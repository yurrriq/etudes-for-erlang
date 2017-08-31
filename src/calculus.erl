%%% =========================================================== [ calculus.erl ]
%%% @doc Etudes for Erlang: 7-1
%%% @end
%%% ==================================================================== [ EOH ]
-module(calculus).

%% Public API.
-export([derivative/2]).

-ifdef(TEST).

-export([f1/1, f2/1, f3/1]).

-endif.


-include("etudes_util.hrl").


%% Macros.
-define(DELTA, 1.0e-10).


%%% =============================== [ Etude 7-1: Simple Higher Order Functions ]

%% @doc Compute the `Derivative' of a given `Function' at a given `Point'.
-spec derivative(Function, Point) -> Derivative when
      Function   :: fun((Point) -> number()),
      Point      :: number(),
      Derivative :: float().
derivative(F, X) ->
    (F(X + ?DELTA) - F(X)) / ?DELTA.


-ifdef(TEST).

%% @hidden
f1(X) -> X * X.


%% @hidden
f2(X) -> 3 * X * X + 2 * X + 1.


%% @hidden
f3(X) -> math:sin(X).


%% @hidden
derivative_test_() ->
    ?TEST_ETUDE(fun derivative/2,
                "The derivative of:~n~s... at ~w is ~w",
                [{6.000000496442226, [fun ?MODULE:f1/1, 3]},
                 {32.00000264769187, [fun ?MODULE:f2/1, 5]},
                 {1.0, [fun ?MODULE:f3/1, 0]}]).

-endif.


%%% ==================================================================== [ EOF ]
