%%% ============================================================== [ dates.erl ]
%%% @doc Etudes for Erlang: 5-2, 6-3
%%% @end
%%% ==================================================================== [ EOH ]
-module(dates).

%% Public API.
-export([date_parts/1, julian/1]).


-include("etudes_util.hrl").


%%% ========================================= [ Etude 5-2: Using the re Module ]


%% @doc Given a `String' of the form "YYYY-MM-DD" return the date `Parts'.
%% ```
%% [Year, Month, Day] = Parts.
%% '''
-spec date_parts(String :: string()) -> Parts :: [integer()].
date_parts(String) ->
    [case string:to_integer(Part) of
         {error, no_integer} ->
             error(no_integer);
         {Int, _Rest} ->
             Int
     end
     || Part <- re:split(String, "-", [{return, list}])].


-ifdef(TEST).

%% @hidden
date_parts_test_() ->
    ?TEST_ETUDE(fun date_parts/1,
                "The date parts of \"~ts\" are ~w",
                [{[2012,12,31], ["2012-12-31"]},
                 {[2013,12,31], ["2013-12-31"]},
                 {[2012,2,5], ["2012-02-05"]},
                 {[2013,2,5], ["2013-02-05"]},
                 {[1900,3,1], ["1900-03-01"]},
                 {[2000,3,1], ["2000-03-01"]},
                 {[2013,1,1], ["2013-01-01"]}]) ++
        [{<<"\"man-of-war\" is not a string in"
            "ISO date format (\"yyyy-mm-dd\")">>,
          ?_assertError(Reason, date_parts(String))}
         || {Reason, String} <- [{no_integer, "man-of-war"},
                                 {badarg, 20170821}]].

-endif.


%%% ============================== [ Etude 6-3: Accumulating the Sum of a List ]

%% @doc Given a `String' of the form "YYYY-MM-DD" return the `JulianDate'.
%% @see date_parts/1
-spec julian(String :: string()) -> JulianDate :: non_neg_integer().
julian(String) ->
    [Year, Month, Day] = date_parts(String),
    Day + do_julian(Year, Month - 1, 0).


-ifdef(TEST).

%% @hidden
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
%% @hidden
do_julian(_Year, 0, JulianDate) ->
    JulianDate;
do_julian(Year, Month, JulianDate) ->
    DaysInMonth = calendar:last_day_of_the_month(Year, Month),
    do_julian(Year, Month - 1, JulianDate + DaysInMonth).


%%% ==================================================================== [ EOF ]
