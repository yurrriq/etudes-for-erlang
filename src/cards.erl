%%% ============================================================== [ cards.erl ]
%%% @doc Etudes for Erlang: 7-5, 7-6
%%% @end
%%% ==================================================================== [ EOH ]
-module(cards).

%% Public API.
-export([make_deck/0, show_deck/1, shuffle/1]).


%% Types.
-export_type([card/0, value/0, suit/0]).

-type card() :: {value(), suit()}.
%% A card is a pair of a {@link value(). value} and a {@link suit(). suit}.

-type value() :: a | 2..10 | j | q | k.
%% A card's value is one of ace, 2..10, jack, queen, and king. Non-numeric
%% values are represented by the first letter of their name, as an atom.

-type suit() :: clubs |
                diamonds |
                hearts |
                spades.
%% The suit of a {@link card(). card}, i.e. clubs, diamonds, hearts, or spades.

%%% ================== [ Etude 7-5: Multiple Generators in List Comprehensions ]

%% @doc Generate a deck of {@link card(). card}s.
-spec make_deck() -> [card()].
make_deck() ->
    [ {Value, Suit} || Suit  <- [clubs, diamonds, hearts, spades],
                       Value <- [a|lists:seq(2, 10) ++ [j,q,k]] ].

%% @doc Pretty print a deck of {@link card(). card}s.
-spec show_deck([card()]) -> ok.
show_deck(Deck) ->
    _ = [ io:format("~p~n", [Card]) || Card <- Deck ],
    ok.


%%% ===================================== [ Etude 7-6: Explaining an Algorithm ]

%% @doc The Fisher-Yates shuffle.
%% @equiv do_shuffle(List, [])
shuffle(List) ->
    do_shuffle(List, []).


%% @doc Shuffle `List' using the First-Yates method.
%%
%% If there's nothing left to shuffle, return the shuffled list.
%%
%% Otherwise, "strike" a random `Elem'ent from `List', prepend it to `Shuffled',
%% shuffle what reamins of `List'. do_shuffle([], Shuffled) -> Shuffled;
do_shuffle(List, Shuffled) ->
    N = length(List),
    {Leading, [Elem | Trailing]} = lists:split(rand:uniform(N) - 1, List),
    do_shuffle(Leading ++ Trailing, [Elem | Shuffled]).


%%% ==================================================================== [ EOF ]
