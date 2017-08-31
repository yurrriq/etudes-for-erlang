

# Module powers #
* [Description](#description)
* [Function Index](#index)
* [Function Details](#functions)

Etudes for Erlang: 4-3, 4-4.

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#raise-2">raise/2</a></td><td>Compute the result of <code>Base</code> raised to the power of <code>Exponent</code>.</td></tr><tr><td valign="top"><a href="#raise-3">raise/3</a></td><td>Tail-recursive, accumulating, nonnegative exponentiation.</td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="raise-2"></a>

### raise/2 ###

<pre><code>
raise(Base, Exponent) -&gt; Exponentiation
</code></pre>

<ul class="definitions"><li><code>Base = number()</code></li><li><code>Exponent = integer()</code></li><li><code>Exponentiation = float() | integer()</code></li></ul>

Compute the result of `Base` raised to the power of `Exponent`.

__See also:__ [raise/3](#raise-3).

<a name="raise-3"></a>

### raise/3 ###

<pre><code>
raise(Base, Exponent, Accumulator) -&gt; Exponentiation
</code></pre>

<ul class="definitions"><li><code>Base = number()</code></li><li><code>Exponent = integer()</code></li><li><code>Accumulator = float()</code></li><li><code>Exponentiation = float() | integer()</code></li></ul>

Tail-recursive, accumulating, nonnegative exponentiation.
Assumes `Exponent` is nonnegative.

