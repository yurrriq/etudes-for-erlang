

# Module teeth #
* [Description](#description)
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)

Etudes for Erlang: 6-4.

<a name="types"></a>

## Data Types ##




### <a name="type-pocket_depth">pocket_depth()</a> ###


<pre><code>
pocket_depth() = [0] | [non_neg_integer()]
</code></pre>

 The depth in millimeters of a pocket, i.e. six measurements around a tooth.
If tooth is missing, `[0]`.

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#alert-1">alert/1</a></td><td>Given a list of <code>PocketDepths</code>, return the list of <code>ProblemTeeth</code>.</td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="alert-1"></a>

### alert/1 ###

<pre><code>
alert(PocketDepths) -&gt; ProblemTeeth
</code></pre>

<ul class="definitions"><li><code>PocketDepths = [<a href="#type-pocket_depth">pocket_depth()</a>]</code></li><li><code>ProblemTeeth = [non_neg_integer()]</code></li></ul>

Given a list of `PocketDepths`, return the list of `ProblemTeeth`.

