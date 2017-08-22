%%% ============================================================== [ dates.erl ]
%%% @doc Etudes for Erlang
%%% @end
%%% ==================================================================== [ EOH ]
-module(dates).

%% Public API.
-export([date_parts/1, julian/1]).


-include("etudes_util.hrl").


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


%%% ============================== [ Etude 6-3: Accumulating the Sum of a List ]

julian(String) ->
    [Year, Month, Day] = date_parts(String),
    Day + do_julian(Year, Month - 1, 0).


-ifdef(TEST).

julian_test_() ->
    ?TEST_ETUDE(fun julian/1,
                "The Julian date of \"~ts\" is ~B",
                [{366, ["2012-12-31"]},
                 {365, ["2013-12-31"]},
                 {36, ["2012-02-05"]},
                 {36, ["2013-02-05"]},
                 {60, ["1900-03-01"]},
                 {61, ["2000-03-1"]},
                 {1, ["2013-01-01"]}]).

-endif.


%%% ========================================================== [ Private Parts ]

%% NOTE: I can't, in good conscience, implement julian/5 as suggested...
do_julian(_Year, 0, JulianDate) ->
    JulianDate;
do_julian(Year, Month, JulianDate) ->
    DaysInMonth = calendar:last_day_of_the_month(Year, Month),
    do_julian(Year, Month - 1, JulianDate + DaysInMonth).


%%% ==================================================================== [ EOF ]
