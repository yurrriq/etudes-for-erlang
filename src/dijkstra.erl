%%% =============================================================== [ geom.erl ]
%%% @doc Etudes for Erlang
%%% @end
%%% ==================================================================== [ EOH ]
-module(dijkstra).

%% Public API.
-export([gcd/2]).


-ifdef(EUNIT).
-include_lib("eunit/include/eunit.hrl").
-endif.


%%% =================================================== [ Etude 4-2: Recursion ]

%% @doc Find the greatest common divisor of two integers.
-spec gcd(M :: non_neg_integer(), N :: pos_integer()) -> pos_integer().
gcd(M, N) when M =:= N ->
    M;
gcd(M, N) when M > N ->
    gcd(M - N, N);
gcd(M, N) ->
    gcd(M, N - M).


-ifdef(EUNIT).

gcd_test_() ->
    Format    = "The GCD of ~B and ~B is ~B.",
    TestCases = [{4, [12, 8]},
                 {7, [14, 21]},
                 {1, [125, 46]},
                 {12, [120, 36]}],
    [ {iolist_to_binary(io_lib:format(Format, [M, N, GCD])),
       ?_assertMatch(GCD, gcd(M, N))}
     || {GCD, [M, N]} <- TestCases].

-endif.


%%% ==================================================================== [ EOF ]
