%%% ============================================================= [ people.erl ]
%%% @doc Etudes for Erlang: 7-2
%%% @end
%%% ==================================================================== [ EOH ]
-module(people).

%% Public API.
-export([males_over_40/0, male_or_over_40/0]).


%% Types.
-export_type([name/0, gender/0, age/0, person/0, person/1]).

-type name() :: string().

-type gender() :: 77 |
                  70.

-type age() :: pos_integer().

-type person() :: {name(), gender(), age()}.

-type person(Gender) :: {name(), Gender, age()}.


%% Macros.
-define(PEOPLE, [{"Federico", $M, 22}, {"Kim", $F, 45}, {"Hansa", $F, 30},
                 {"Tran", $M, 47}, {"Cathy", $F, 32}, {"Elias", $M, 50}]).


-include("etudes_util.hrl").


%%% ==================== [ Etude 7-2: List Comprehensions and Pattern Matching ]

%%% Part One.
%% @doc Return the list of males over 40 in `?PEOPLE'.
-spec males_over_40() -> [person(77)].
males_over_40() ->
    [ Person || {_Name,Gender,Age}=Person <- ?PEOPLE,
                $M =:= Gender,
                Age > 40 ].


-ifdef(TEST).

%% @hidden
males_over_40_test_() ->
    ?TEST_ETUDE(fun males_over_40/0,
                "The males over 40 are ~p",
                [{[{"Tran",$M,47},{"Elias",$M,50}], []}]).

-endif.


%% Part Two.
%% @doc Return the list of people in `?PEOPLE' who are male _or_ over 40.
-spec male_or_over_40() -> [person()].
male_or_over_40() ->
    [ Person || {_Name,Gender,Age}=Person <- ?PEOPLE,
                $M =:= Gender orelse Age > 40 ].

-ifdef(TEST).

%% @hidden
male_or_over_40_test_() ->
    ?TEST_ETUDE(fun male_or_over_40/0,
                "The people male or over 40 are ~p",
                [{[{"Federico",$M,22},
                   {"Kim",$F,45},
                   {"Tran",$M,47},
                   {"Elias",$M,50}], []}]).

-endif.


%%% ==================================================================== [ EOF ]
