

# Module cards #
* [Description](#description)
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)

Etudes for Erlang: 7-5, 7-6.

<a name="types"></a>

## Data Types ##




### <a name="type-card">card()</a> ###


<pre><code>
card() = {<a href="#type-value">value()</a>, <a href="#type-suit">suit()</a>}
</code></pre>

 A card is a pair of a [value](#type-value) and a [suit](#type-suit).



### <a name="type-suit">suit()</a> ###


<pre><code>
suit() = clubs | diamonds | hearts | spades
</code></pre>

 The suit of a [card](#type-card), i.e. clubs, diamonds, hearts, or spades.



### <a name="type-value">value()</a> ###


<pre><code>
value() = a | 2..10 | j | q | k
</code></pre>

 A card's value is one of ace, 2..10, jack, queen, and king. Non-numeric
values are represented by the first letter of their name, as an atom.

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#do_shuffle-2">do_shuffle/2*</a></td><td>Shuffle <code>List</code> using the First-Yates method.</td></tr><tr><td valign="top"><a href="#make_deck-0">make_deck/0</a></td><td>Generate a deck of <a href="#type-card">card</a>s.</td></tr><tr><td valign="top"><a href="#show_deck-1">show_deck/1</a></td><td>Pretty print a deck of <a href="#type-card">card</a>s.</td></tr><tr><td valign="top"><a href="#shuffle-1">shuffle/1</a></td><td>The Fisher-Yates shuffle.</td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="do_shuffle-2"></a>

### do_shuffle/2 * ###

`do_shuffle(List, Shuffled) -> any()`

Shuffle `List` using the First-Yates method.

If there's nothing left to shuffle, return the shuffled list.

Otherwise, "strike" a random `Elem`ent from `List`, prepend it to `Shuffled`,
shuffle what reamins of `List`. do_shuffle([], Shuffled) -> Shuffled;

<a name="make_deck-0"></a>

### make_deck/0 ###

<pre><code>
make_deck() -&gt; [<a href="#type-card">card()</a>]
</code></pre>
<br />

Generate a deck of [card](#type-card)s.

<a name="show_deck-1"></a>

### show_deck/1 ###

<pre><code>
show_deck(Deck::[<a href="#type-card">card()</a>]) -&gt; ok
</code></pre>
<br />

Pretty print a deck of [card](#type-card)s.

<a name="shuffle-1"></a>

### shuffle/1 ###

`shuffle(List) -> any()`

Equivalent to [`do_shuffle(List, [])`](#do_shuffle-2).

The Fisher-Yates shuffle.

