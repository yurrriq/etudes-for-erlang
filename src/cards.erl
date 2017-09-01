%%% ============================================================== [ cards.erl ]
%%% @doc Etudes for Erlang: 7-5
%%% @end
%%% ==================================================================== [ EOH ]
-module(cards).

%% Public API.
-export([make_deck/0, show_deck/1]).


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


%%% ==================================================================== [ EOF ]
