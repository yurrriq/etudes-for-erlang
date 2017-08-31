

# Module stats #
* [Description](#description)
* [Function Index](#index)
* [Function Details](#functions)

Etudes for Erlang: 6-1, 6-2.

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#do_maximum-2">do_maximum/2*</a></td><td>Tail-recursive implementation of <a href="#maximum-1"><code>maximum/1</code></a>.</td></tr><tr><td valign="top"><a href="#do_minimum-2">do_minimum/2*</a></td><td>Tail-recursive implementation of <a href="#minimum-1"><code>minimum/1</code></a>.</td></tr><tr><td valign="top"><a href="#maximum-1">maximum/1</a></td><td>Return the greatest number in <code>Numbers</code>.</td></tr><tr><td valign="top"><a href="#minimum-1">minimum/1</a></td><td>Return the smallest number in <code>Numbers</code>.</td></tr><tr><td valign="top"><a href="#range-1">range/1</a></td><td>Equivalent to <tt>{minimum(Numbers), maximum(Numbers)}</tt>.</td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="do_maximum-2"></a>

### do_maximum/2 * ###

<pre><code>
do_maximum(RemainingNumbers, Candidate) -&gt; Maximum
</code></pre>

<ul class="definitions"><li><code>RemainingNumbers = [number()]</code></li><li><code>Candidate = number()</code></li><li><code>Maximum = number()</code></li></ul>

Tail-recursive implementation of [`maximum/1`](#maximum-1).

<a name="do_minimum-2"></a>

### do_minimum/2 * ###

<pre><code>
do_minimum(RemainingNumbers, Candidate) -&gt; Minimum
</code></pre>

<ul class="definitions"><li><code>RemainingNumbers = [number()]</code></li><li><code>Candidate = number()</code></li><li><code>Minimum = number()</code></li></ul>

Tail-recursive implementation of [`minimum/1`](#minimum-1).

<a name="maximum-1"></a>

### maximum/1 ###

<pre><code>
maximum(Numbers::[number(), ...]) -&gt; Maximum::number()
</code></pre>
<br />

Equivalent to [`lists:max(Numbers)`](lists.md#max-1).

Return the greatest number in `Numbers`.

<a name="minimum-1"></a>

### minimum/1 ###

<pre><code>
minimum(Numbers::[number(), ...]) -&gt; Minimum::number()
</code></pre>
<br />

Equivalent to [`lists:min(Numbers)`](lists.md#min-1).

Return the smallest number in `Numbers`.

<a name="range-1"></a>

### range/1 ###

<pre><code>
range(Numbers) -&gt; {Minimum, Maximum}
</code></pre>

<ul class="definitions"><li><code>Numbers = [number(), ...]</code></li><li><code>Minimum = number()</code></li><li><code>Maximum = number()</code></li></ul>

Equivalent to `{minimum(Numbers), maximum(Numbers)}`.

__See also:__ [maximum/1](#maximum-1), [minimum/1](#minimum-1).

