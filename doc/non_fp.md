

# Module non_fp #
* [Description](#description)
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)

Etudes for Erlang: 6-5.

<a name="types"></a>

## Data Types ##




### <a name="type-tooth_presence">tooth_presence()</a> ###


<pre><code>
tooth_presence() = 84 | 70
</code></pre>

`$T` if present, otherwise `$F`.

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#generate_teeth-2">generate_teeth/2</a></td><td>Given a <code>String</code> reprenting the precense of teeth and a <code>Probability</code>
that a tooth will be good, generate a list of <code>Teeth</code>.</td></tr><tr><td valign="top"><a href="#generate_teeth-3">generate_teeth/3</a></td><td>Accumulator for <a href="#generate_teeth-2"><code>generate_teeth/2</code></a>.</td></tr><tr><td valign="top"><a href="#generate_tooth-1">generate_tooth/1</a></td><td>Given a <code>Probability</code> a tooth will be good, generate its <code>PocketDepth</code>.</td></tr><tr><td valign="top"><a href="#generate_tooth-3">generate_tooth/3</a></td><td>Tail-recursive implementation of <a href="#generate_tooth-1"><code>generate_tooth/1</code></a>.</td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="generate_teeth-2"></a>

### generate_teeth/2 ###

<pre><code>
generate_teeth(String, Probability) -&gt; Teeth
</code></pre>

<ul class="definitions"><li><code>String = [<a href="#type-tooth_presence">tooth_presence()</a>, ...]</code></li><li><code>Probability = float()</code></li><li><code>Teeth = [<a href="teeth.md#type-pocket_depth">teeth:pocket_depth()</a>, ...]</code></li></ul>

Equivalent to [`generate_teeth(String, Probability, [])`](#generate_teeth-3).

Given a `String` reprenting the precense of teeth and a `Probability`
that a tooth will be good, generate a list of `Teeth`.

<a name="generate_teeth-3"></a>

### generate_teeth/3 ###

<pre><code>
generate_teeth(String, Probability, Teeth) -&gt; Teeth
</code></pre>

<ul class="definitions"><li><code>String = [<a href="#type-tooth_presence">tooth_presence()</a>]</code></li><li><code>Probability = float()</code></li><li><code>Teeth = [<a href="teeth.md#type-pocket_depth">teeth:pocket_depth()</a>]</code></li></ul>

Accumulator for [`generate_teeth/2`](#generate_teeth-2).

<a name="generate_tooth-1"></a>

### generate_tooth/1 ###

<pre><code>
generate_tooth(Probability) -&gt; PocketDepth
</code></pre>

<ul class="definitions"><li><code>Probability = float()</code></li><li><code>PocketDepth = <a href="teeth.md#type-depth_measurements">teeth:depth_measurements()</a></code></li></ul>

Given a `Probability` a tooth will be good, generate its `PocketDepth`.

__See also:__ [generate_tooth/3](#generate_tooth-3).

<a name="generate_tooth-3"></a>

### generate_tooth/3 ###

<pre><code>
generate_tooth(BaseDepth, Measurements, PocketDepth) -&gt; PocketDepth
</code></pre>

<ul class="definitions"><li><code>BaseDepth = 2 | 3</code></li><li><code>Measurements = 0..6</code></li><li><code>PocketDepth = <a href="teeth.md#type-depth_measurements">teeth:depth_measurements()</a></code></li></ul>

Tail-recursive implementation of [`generate_tooth/1`](#generate_tooth-1).

```
  Measurements :: 0..6
```

