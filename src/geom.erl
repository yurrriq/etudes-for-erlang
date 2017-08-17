%%% =============================================================== [ geom.erl ]
%%% @doc Etudes for Erlang
%%% @end
%%% ==================================================================== [ EOH ]
-module(geom).

%% Public API.
-export([area/2, area/3, area/1, area1/3]).


%% Types.
-export_type([shape/0]).

-type shape() :: rectangle
               | triangle
               | ellipse.
%% A shape is a rectangle, triangle or ellipse.


-include("etudes_util.hrl").


%% Macros.
-define(PI, math:pi()).


%%% ========================================== [ Etude 2-1: Writing a Function ]

%% @doc Compute the area of a quadrangle from a given `Width' and `Height'.
-spec area(Width :: number(), Height :: number()) -> Area :: number().
area(Width, Height) ->
    Width * Height.


-ifdef(TEST).

area2_test_() ->
    ?TEST_ETUDE(fun area/2,
                "The area of a ~wx~w quadrangle is ~w",
                [{12, [3, 4]},
                 {84, [12, 7]}]).

-endif.


%%% ============================================ [ Etude 3-1: Pattern Matching ]

%% @doc Compute the area of a given `Width' by `Height' `Shape'.
-spec area(Shape, Width, Height) -> Area when
      Shape  :: shape(),
      Width  :: number(),
      Height :: number(),
      Area   :: number().
area(_Shape, Width, Height) when Width < 0; Height < 0 -> % Etude 3-2: Guards
    error(invalid_dimension);
area(rectangle, Width, Height) ->
    area(Width, Height);
area(triangle, Base, Height) ->
    Base * Height / 2.0;
area(ellipse, Width, Height) ->
    ?PI * Width * Height;
area(Shape, _Width, _Height) ->
    error({unknown_shape, Shape}).


-ifdef(TEST).

area3_test_() ->
    ?TEST_ETUDE(fun area/3,
                "The area of a ~s (~wx~w) is ~w",
                [{12, [rectangle, 3, 4]},
                 {7.5, [triangle, 3, 5]},
                 {25.132741228718345, [ellipse, 2, 4]}]) ++
        [{<<"Negative dimensions are invalid">>,
          ?_assertError(invalid_dimension, area(square, -1, 3))},
         {<<"A shield toad is not a shape">>,
          ?_assertError({unknown_shape, shield_toad},
                        area(shield_toad, 42, 42))}].

-endif.


%%% ================================================== [ Etude 4-1: Using case ]

%% @equiv area(Shape, Width, Height)
%% @doc {@link area/3}, implemented with `case' instead of guards.
-spec area1(Shape, Width, Height) -> Area when
      Shape  :: shape(),
      Width  :: number(),
      Height :: number(),
      Area   :: number().
area1(_Shape, Width, Height) when Width < 0; Height < 0 ->
    error(invalid_dimension);
area1(Shape, Width, Height) ->
    case Shape of
        rectangle ->
            area(Width, Height);
        triangle ->
            Width * Height / 2.0;
        ellipse ->
            ?PI * Width * Height
    end.


-ifdef(TEST).

area13_test_() ->
    ?TEST_ETUDE(fun area1/3,
                "The area of a ~s (~wx~w) is ~w",
                [{12, [rectangle, 3, 4]},
                 {7.5, [triangle, 3, 5]},
                 {25.132741228718345, [ellipse, 2, 4]}]) ++
        [{<<"Negative dimensions are invalid">>,
          ?_assertError(invalid_dimension, area1(square, -1, 3))}].

-endif.


%%% ======================================== [ Etude 3-4: Tuples as Parameters ]

%% @equiv area(Shape, Width, Height)
-spec area({Shape, Width, Height}) -> Area when
      Shape  :: shape(),
      Width  :: number(),
      Height :: number(),
      Area   :: number().
area({Shape, Width, Height}) ->
    area(Shape, Width, Height).


-ifdef(TEST).

area1_test_() ->
    ?TEST_ETUDE(fun area/1,
                "area(~w) = ~w",
                [{21, [{rectangle, 7, 3}]},
                 {10.5, [{triangle, 7, 3}]},
                 {65.97344572538566, [{ellipse, 7, 3}]}]).

-endif.


%%% ==================================================================== [ EOF ]
