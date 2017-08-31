%%% ============================================================= [ non_fp.erl ]
%%% @doc Etudes for Erlang: 6-5
%%% @end
%%% ==================================================================== [ EOH ]
-module(non_fp).

%% Public API.
-export([generate_teeth/2, generate_teeth/3,
         generate_tooth/1, generate_tooth/3]).


%% Types.
-export_type([tooth_presence/0]).

-type tooth_presence() :: $T |
                          $F.
%% `$T' if present, otherwise `$F'.


-include("etudes_util.hrl").


%%% =================== [ Etude 6-5: Random Numbers; Generating Lists of Lists ]

%% @doc Given a `String' reprenting the precense of teeth and a `Probability'
%% that a tooth will be good, generate a list of `Teeth'.
%% @equiv generate_teeth(String, Probability, [])
-spec generate_teeth(String, Probability) -> Teeth when
      String      :: [tooth_presence(),...],
      Probability :: float(),
      Teeth       :: [teeth:pocket_depth(),...].
generate_teeth(String, Probability) ->
    generate_teeth(String, Probability, []).


%% @doc Accumulator for {@link generate_teeth/2}.
-spec generate_teeth(String, Probability, Teeth) -> Teeth when
      String      :: [tooth_presence()],
      Probability :: float(),
      Teeth       :: [teeth:pocket_depth()].
generate_teeth([], _Probability, Teeth) ->
    lists:reverse(Teeth);
generate_teeth([$F|Presences], Probability, Teeth) ->
    generate_teeth(Presences, Probability, [[0]|Teeth]);
generate_teeth([$T|Presences], Probability, Teeth) ->
    Tooth = generate_tooth(Probability),
    generate_teeth(Presences, Probability, [Tooth|Teeth]).


%% @doc Given a `Probability' a tooth will be good, generate its `PocketDepth'.
%% @see generate_tooth/3
-spec generate_tooth(Probability) -> PocketDepth when
      Probability :: float(),
      PocketDepth :: teeth:depth_measurements().
generate_tooth(Probability) ->
    BaseDepth = ?IF(rand:uniform() < Probability, 2, 3),
    generate_tooth(BaseDepth, 6, []).


%% @doc Tail-recursive implementation of {@link generate_tooth/1}.
%% ```
%% Measurements :: 0..6
%% '''
-spec generate_tooth(BaseDepth, Measurements, PocketDepth) -> PocketDepth when
      BaseDepth    :: 2 | 3,
      Measurements :: 0..6,
      PocketDepth  :: teeth:depth_measurements().
generate_tooth(_BaseDepth, 0, PocketDepth) ->
    lists:reverse(PocketDepth);
generate_tooth(BaseDepth, Remaining, Measurements) ->
    Measurement = BaseDepth + rand:uniform(3) - 2,
    generate_tooth(BaseDepth, Remaining - 1, [Measurement|Measurements]).


%%% ==================================================================== [ EOF ]
