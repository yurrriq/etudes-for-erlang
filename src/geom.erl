%%% =============================================================== [ geom.erl ]
%%% @doc Etudes for Erlang
%%% @end
%%% ==================================================================== [ EOH ]
-module(geom).

%% Public API.
-export([area/2]).


-ifdef(EUNIT).
-include_lib("eunit/include/eunit.hrl").
-endif.


%%% ========================================== [ Etude 2-1: Writing a Function ]

%% @doc Compute the area of a quadrangle from a given `Width' and `Height'.
-spec area(Width :: number(), Height :: number()) -> Area :: number().
area(Width, Height) ->
    Width * Height.


-ifdef(TEST).

area2_test_() ->
    Format    = "The area of a ~wx~w quadrangle is ~w.",
    TestCases = [{12, [3, 4]},
                 {84, [12, 7]}],
    [{iolist_to_binary(io_lib:format(Format, [Width, Height, Area])),
      ?_assertMatch(Area, area(Width, Height))}
     || {Area, [Width, Height]} <- TestCases].

-endif.


%%% ==================================================================== [ EOF ]
