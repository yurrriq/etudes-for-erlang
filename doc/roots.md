

# Module roots #
* [Description](#description)
* [Function Index](#index)
* [Function Details](#functions)

Etudes for Erlang.

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#nth_root-2">nth_root/2</a></td><td>Compute the <code>N</code>th root of <code>Number</code>, using the
<a href="https://en.wikipedia.org/wiki/Newton%27s_method">Newton-Raphson
method</a>.</td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="nth_root-2"></a>

### nth_root/2 ###

<pre><code>
nth_root(Number::number(), N::integer()) -&gt; NthRoot::number()
</code></pre>
<br />

Compute the `N`th root of `Number`, using the
[Newton-Raphson
method](https://en.wikipedia.org/wiki/Newton%27s_method).

