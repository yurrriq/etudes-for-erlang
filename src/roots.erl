%%% ============================================================== [ roots.erl ]
%%% @doc Etudes for Erlang: 4-5
%%% @end
%%% ==================================================================== [ EOH ]
-module(roots).

%% Public API.
-export([nth_root/2]).


-include("etudes_util.hrl").


-define(LIMIT, 1.0e-8).


%%% ============================ [ Etude 4-5: Recursion with a Helper Function ]

%% @doc Compute the `N'th root of `Number', using the
%% <a href="https://en.wikipedia.org/wiki/Newton%27s_method">Newton-Raphson
%% method</a>.
-spec nth_root(Number :: number(), N :: integer()) -> NthRoot :: number().
nth_root(Number, N) ->
    Guess = Number / 2.0,
    do_nth_root(Number, N, Guess).

%% @hidden
do_nth_root(Number, N, Guess) ->
    io:format("Current guess is ~p~n", [Guess]),
    F      = powers:raise(Guess, N) - Number,
    FPrime = N * powers:raise(Guess, N - 1),
    Next   = Guess - F / FPrime,
    ?IF(abs(Next - Guess) < ?LIMIT,
        Next,
        do_nth_root(Number, N, Next)).


-ifdef(TEST).

%% @hidden
nth_root_test_() ->
    ?TEST_ETUDE(fun nth_root/2,
                "~w's ~wth root is ~w",
                [{3.0, [27, 3]}]).

-endif.

%%% ==================================================================== [ EOF ]
