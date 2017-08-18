

# Module geom #
* [Description](#description)
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)

Etudes for Erlang.

<a name="types"></a>

## Data Types ##




### <a name="type-shape">shape()</a> ###


<pre><code>
shape() = rectangle | triangle | ellipse
</code></pre>

 A shape is a rectangle, triangle or ellipse.

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#area-1">area/1</a></td><td>Equivalent to <a href="#area-3"><tt>area(Shape, Width, Height)</tt></a>.</td></tr><tr><td valign="top"><a href="#area-2">area/2</a></td><td>Compute the area of a quadrangle from a given <code>Width</code> and <code>Height</code>.</td></tr><tr><td valign="top"><a href="#area-3">area/3</a></td><td>Compute the area of a given <code>Width</code> by <code>Height</code> <code>Shape</code>.</td></tr><tr><td valign="top"><a href="#area1-3">area1/3</a></td><td><a href="#area-3"><code>area/3</code></a>, implemented with <code>case</code> instead of guards.</td></tr><tr><td valign="top"><a href="#area13_test_-0">area13_test_/0*</a></td><td></td></tr><tr><td valign="top"><a href="#area1_test_-0">area1_test_/0*</a></td><td></td></tr><tr><td valign="top"><a href="#area2_test_-0">area2_test_/0*</a></td><td></td></tr><tr><td valign="top"><a href="#area3_test_-0">area3_test_/0*</a></td><td></td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="area-1"></a>

### area/1 ###

<pre><code>
area(X1::{Shape, Width, Height}) -&gt; Area
</code></pre>

<ul class="definitions"><li><code>Shape = <a href="#type-shape">shape()</a></code></li><li><code>Width = number()</code></li><li><code>Height = number()</code></li><li><code>Area = number()</code></li></ul>

Equivalent to [`area(Shape, Width, Height)`](#area-3).

<a name="area-2"></a>

### area/2 ###

<pre><code>
area(Width::number(), Height::number()) -&gt; Area::number()
</code></pre>
<br />

Compute the area of a quadrangle from a given `Width` and `Height`.

<a name="area-3"></a>

### area/3 ###

<pre><code>
area(Shape, Width, Height) -&gt; Area
</code></pre>

<ul class="definitions"><li><code>Shape = <a href="#type-shape">shape()</a></code></li><li><code>Width = number()</code></li><li><code>Height = number()</code></li><li><code>Area = number()</code></li></ul>

Compute the area of a given `Width` by `Height` `Shape`.

<a name="area1-3"></a>

### area1/3 ###

<pre><code>
area1(Shape, Width, Height) -&gt; Area
</code></pre>

<ul class="definitions"><li><code>Shape = <a href="#type-shape">shape()</a></code></li><li><code>Width = number()</code></li><li><code>Height = number()</code></li><li><code>Area = number()</code></li></ul>

Equivalent to [`area(Shape, Width, Height)`](#area-3).

[`area/3`](#area-3), implemented with `case` instead of guards.

<a name="area13_test_-0"></a>

### area13_test_/0 * ###

`area13_test_() -> any()`

<a name="area1_test_-0"></a>

### area1_test_/0 * ###

`area1_test_() -> any()`

<a name="area2_test_-0"></a>

### area2_test_/0 * ###

`area2_test_() -> any()`

<a name="area3_test_-0"></a>

### area3_test_/0 * ###

`area3_test_() -> any()`

