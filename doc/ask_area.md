

# Module ask_area #
* [Description](#description)
* [Function Index](#index)
* [Function Details](#functions)

Etudes for Erlang: 5-1.

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#area-0">area/0</a></td><td>Interactively compute the area of a known <a href="geom.md#type-shape"><code>geom:shape()</code></a>.</td></tr><tr><td valign="top"><a href="#char_to_shape-1">char_to_shape/1*</a></td><td>Convert a <code>Char</code> to a known <code>Shape</code>, if possible.</td></tr><tr><td valign="top"><a href="#get_dimensions-2">get_dimensions/2*</a></td><td>Call <a href="#get_number-1"><code>get_number/1</code></a> twice and combine the output.</td></tr><tr><td valign="top"><a href="#get_line-1">get_line/1*</a></td><td>A slightly safer (less error-prone) version of <a href="io.md#get_line-1"><code>io:get_line/1</code></a>.</td></tr><tr><td valign="top"><a href="#get_number-1">get_number/1*</a></td><td>Print <code>Prompt</code> and parse user input for a <code>Number</code>.</td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="area-0"></a>

### area/0 ###

<pre><code>
area() -&gt; Area::number()
</code></pre>
<br />

Interactively compute the area of a known [`geom:shape()`](geom.md#type-shape).

__See also:__ [geom:area/3](geom.md#area-3).

<a name="char_to_shape-1"></a>

### char_to_shape/1 * ###

<pre><code>
char_to_shape(Char) -&gt; {ok, Shape} | {error, unknown_shape}
</code></pre>

<ul class="definitions"><li><code>Char = char()</code></li><li><code>Shape = <a href="geom.md#type-shape">geom:shape()</a></code></li></ul>

Convert a `Char` to a known `Shape`, if possible.

<a name="get_dimensions-2"></a>

### get_dimensions/2 * ###

<pre><code>
get_dimensions(Prompt1, Prompt2) -&gt; {Dimension1, Dimension2}
</code></pre>

<ul class="definitions"><li><code>Prompt1 = string()</code></li><li><code>Prompt2 = string()</code></li><li><code>Dimension1 = number()</code></li><li><code>Dimension2 = number()</code></li></ul>

Call [`get_number/1`](#get_number-1) twice and combine the output.

<a name="get_line-1"></a>

### get_line/1 * ###

<pre><code>
get_line(Prompt) -&gt; {ok, String} | {error, Reason}
</code></pre>

<ul class="definitions"><li><code>Prompt = string()</code></li><li><code>String = string()</code></li><li><code>Reason = eof | term()</code></li></ul>

A slightly safer (less error-prone) version of [`io:get_line/1`](io.md#get_line-1).

<a name="get_number-1"></a>

### get_number/1 * ###

<pre><code>
get_number(Prompt) -&gt; {ok, Number} | {error, no_number}
</code></pre>

<ul class="definitions"><li><code>Number = number()</code></li><li><code>Prompt = string()</code></li></ul>

Print `Prompt` and parse user input for a `Number`.

