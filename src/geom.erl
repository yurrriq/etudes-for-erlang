%%% =============================================================== [ geom.erl ]
%%% @doc Etudes for Erlang
%%% @end
%%% ==================================================================== [ EOH ]
-module(geom).

%% Public API.
-export([area/2, area/1, area1/3]).


%% Types.
-export_type([shape/0]).

-type shape() :: rectangle
               | triangle
               | ellipse.
%% A shape is a rectangle, triangle or ellipse.


-ifdef(EUNIT).
-include_lib("eunit/include/eunit.hrl").
-endif.


%% Macros.
-define(PI, math:pi()).


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


%%% ============================================ [ Etude 3-1: Pattern Matching ]

-spec area(Shape, Width, Height) -> Area when
      Shape  :: shape(),
      Width  :: number(),
      Height :: number(),
      Area   :: number().
area(rectangle, Width, Height) ->
    area(Width, Height);
area(triangle, Base, Height) ->
    Base * Height / 2.0;
area(ellipse, Width, Height) ->
    ?PI * Width * Height;
area(_Shape, Width, Height) when Width < 0; Height < 0 -> % Etude 3-2: Guards
    error(invalid_dimension);
area(Shape, _Width, _Height) ->
    error({unknown_shape, Shape}).


%%% ================================================== [ Etude 4-1: Using case ]

-spec area1(Shape, Width, Height) -> Area when
      Shape  :: shape(),
      Width  :: number(),
      Height :: number(),
      Area   :: number().
area1(Shape, Width, Height) ->
    case Shape of
        rectangle ->
            area(Width, Height);
        triangle ->
            Width * Height / 2.0;
        ellipse ->
            ?PI * Width * Height
    end;
area1(_Shape, Width, Height) when Width < 0; Height < 0 ->
    error(invalid_dimension).


-ifdef(EUNIT).

area3_test_() ->
    Format    = "The area of a ~wx~w ~s is ~w.",
    TestCases = [{12, [rectangle, 3, 4]},
                 {7.5, [triangle, 3, 5]},
                 {25.132741228718345, [ellipse, 2, 4]}],
    [{iolist_to_binary(io_lib:format(Format, [Width, Height, Shape, Area])),
      ?_assertMatch(Area, area(Shape, Width, Height))}
     || {Area, [Shape, Width, Height]} <- TestCases] ++
        [{<<"Negative dimensions are invalid.">>,
          ?_assertError(invalid_dimension, area(square, -1, 3))}].

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


-ifdef(EUNIT).

area1_test_() ->
    Format    = "The area of a ~wx~w ~s is ~w.",
    TestCases = [{21, {rectangle, 7, 3}},
                 {10.5, {triangle, 7, 3}},
                 {65.97344572538566, {ellipse, 7, 3}}],
    [{iolist_to_binary(io_lib:format(Format, [Width, Height, Shape, Area])),
      ?_assertMatch(Area, area(Tuple))}
     || {Area, {Shape, Width, Height} = Tuple} <- TestCases].

-endif.


%%% ==================================================================== [ EOF ]
