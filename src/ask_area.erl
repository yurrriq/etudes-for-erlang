%%% =========================================================== [ ask_area.erl ]
%%% @doc Etudes for Erlang
%%% @end
%%% ==================================================================== [ EOH ]
-module(ask_area).

%% Public API.
-export([area/0]).


%%% ============================================ [ Etude 5-1: Validating Input ]

%% @doc Interactively compute the area of a known {@link geom:shape()}.
%% @see geom:area/3.
-spec area() -> Area :: number().
area() ->
    {ok, [Char|_Rest]} = get_line("R)ectangle, T)riangle, or E)llipse > "),
    {ok, Shape} = char_to_shape(Char),
    do_area(Shape).


%%% ========================================================= [ Private Partss ]

%% @hidden
-spec do_area(Shape :: geom:shape()) -> Area :: number().
do_area(rectangle = Shape) ->
    {Width, Height} = get_dimensions("width", "height"),
    geom:area(Shape, Width, Height);
do_area(triangle = Shape) ->
    {Base, Height} = get_dimensions("base", "height"),
    geom:area(Shape, Base, Height);
do_area(ellipse = Shape) ->
    {MajorAxis, MinorAxis} = get_dimensions("major axis", "minor axis"),
    geom:area(Shape, MajorAxis, MinorAxis).


%% @doc Convert a `Char' to a known `Shape', if possible.
-spec char_to_shape(Char) -> {ok, Shape} | {error, unknown_shape} when
      Char :: char(),
      Shape :: geom:shape().
char_to_shape(Char) ->
    do_char_to_shape(string:to_upper(Char)).


%% @hidden
-spec do_char_to_shape(Char) -> {ok, Shape} | {error, unknown_shape} when
      Char :: char(),
      Shape :: geom:shape().
do_char_to_shape($R) ->
    {ok, rectangle};
do_char_to_shape($T) ->
    {ok, triangle};
do_char_to_shape($E) ->
    {ok, ellipse};
do_char_to_shape(_Char) ->
    {error, unknown_shape}.


%% @doc Call {@link get_number/1} twice and combine the output.
-spec get_dimensions(Prompt1, Prompt2) -> {Dimension1, Dimension2} when
      Prompt1    :: string(),
      Prompt2    :: string(),
      Dimension1 :: number(),
      Dimension2 :: number().
get_dimensions(Prompt1, Prompt2) ->
    {ok, Dimension1} = get_number("Enter " ++ Prompt1 ++ " > "),
    {ok, Dimension2} = get_number("Enter " ++ Prompt2 ++ " > "),
    {Dimension1, Dimension2}.


%% @doc Print `Prompt' and parse user input for a `Number'.
-spec get_number(Prompt) -> {ok, Number} | {error, no_number} when
      Number :: number(),
      Prompt :: string().
get_number(Prompt) ->
    {ok, Line} = get_line(Prompt),
    do_get_number(Line).

%% @hidden
do_get_number(String) ->
    case string:to_float(String) of
        {error, _FloatReason} ->
            case string:to_integer(String) of
                {error, _IntegerReason} ->
                    io:fwrite("2~n"),
                    {error, no_number};
                {Integer, _Rest} ->
                    {ok, Integer}
            end;
        {Float, _Rest} ->
            {ok, Float}
    end.


%% @doc A slightly safer (less error-prone) version of {@link io:get_line/1}.
-spec get_line(Prompt) -> {ok, String} | {error, Reason} when
      Prompt :: string(),
      String :: string(),
      Reason :: eof | term().
get_line(Prompt) ->
    do_get_line(io:get_line(Prompt)).


%% @hidden
-spec do_get_line(Data) -> {ok, String} | {error, Reason} when
      Data   :: string() | io:server_no_data(),
      String :: string(),
      Reason :: eof | term().
do_get_line(eof) ->
    {error, eof};
do_get_line({error, _Reason} = Error) ->
    Error;
do_get_line(Line) ->
    {ok, Line}.


%%% ==================================================================== [ EOF ]
