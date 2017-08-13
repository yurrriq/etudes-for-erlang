

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


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#area-2">area/2</a></td><td>Compute the area of a quadrangle from a given <code>Width</code> and <code>Height</code>.</td></tr><tr><td valign="top"><a href="#area-3">area/3</a></td><td></td></tr></table>


<a name="functions"></a>

## Function Details ##

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

