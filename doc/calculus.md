

# Module calculus #
* [Description](#description)
* [Function Index](#index)
* [Function Details](#functions)

Etudes for Erlang: 7-1.

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#derivative-2">derivative/2</a></td><td>Compute the <code>Derivative</code> of a given <code>Function</code> at a given <code>Point</code>.</td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="derivative-2"></a>

### derivative/2 ###

<pre><code>
derivative(Function, Point) -&gt; Derivative
</code></pre>

<ul class="definitions"><li><code>Function = fun((Point) -&gt; number())</code></li><li><code>Point = number()</code></li><li><code>Derivative = float()</code></li></ul>

Compute the `Derivative` of a given `Function` at a given `Point`.

