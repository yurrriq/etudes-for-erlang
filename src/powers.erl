%%% ============================================================= [ powers.erl ]
%%% @doc Etudes for Erlang
%%% @end
%%% ==================================================================== [ EOH ]
-module(powers).

%% Public API.
-export([raise/2]).


-include("etudes_util.hrl").


%%% ================================ [ Etude 4-3: Non-Tail Recursive Functions ]

%% @doc Compute the result of `Base' raised to the power of `Exponent'.
-spec raise(Base, Exponent) -> Exponentiation when
      Base           :: number(),
      Exponent       :: integer(),
      Exponentiation :: float().
raise(_Base, 0) ->
    1;
raise(Base, 1) ->
    Base;
raise(Base, Exponent) when Exponent < 0 ->
    1.0 / raise(Base, -Exponent);
raise(Base, Exponent) ->
    raise(Base, Exponent, 1).


-ifdef(TEST).

raise_test_() ->
    ?TEST_ETUDE(fun raise/2,
                "~w to the power of ~w is ~w",
                [{5, [5, 1]},
                 {8, [2, 3]},
                 {1.728, [1.2, 3]},
                 {1, [2, 0]},
                 {0.125, [2, -3]}]).

-endif.


%%% ========================== [ Etude 4-4: Tail Recursion with an Accumulator ]

raise(_Base, 0, Accumulator) ->
    Accumulator;
raise(Base, Exponent, Accumulator) ->
    raise(Base, Exponent - 1, Base * Accumulator).


%%% ==================================================================== [ EOF ]
