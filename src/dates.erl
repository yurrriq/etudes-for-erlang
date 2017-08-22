%%% ============================================================== [ dates.erl ]
%%% @doc Etudes for Erlang
%%% @end
%%% ==================================================================== [ EOH ]
-module(dates).

%% Public API.
-export([date_parts/1]).


%%% ========================================= [ Etude 5-2: Using the re Module ]

-spec date_parts(String :: string()) -> Parts :: [integer()].
date_parts(String) ->
    [case string:to_integer(Part) of
         {error, Reason} ->
             error(Reason);
         {Int, _Rest} ->
             Int
     end
     || Part <- re:split(String, "-", [{return, list}])].


%%% ==================================================================== [ EOF ]
