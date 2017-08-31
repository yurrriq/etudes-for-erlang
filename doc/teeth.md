

# Module teeth #
* [Description](#description)
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)

Etudes for Erlang: 6-4.

<a name="types"></a>

## Data Types ##




### <a name="type-depth_measurements">depth_measurements()</a> ###


<pre><code>
depth_measurements() = [pos_integer()]
</code></pre>




### <a name="type-missing_depth">missing_depth()</a> ###


<pre><code>
missing_depth() = [0]
</code></pre>




### <a name="type-pocket_depth">pocket_depth()</a> ###


<pre><code>
pocket_depth() = <a href="#type-missing_depth">missing_depth()</a> | <a href="#type-depth_measurements">depth_measurements()</a>
</code></pre>

 The depth in millimeters of a pocket, i.e. six measurements around a tooth.
If tooth is missing, `[0]`.



### <a name="type-tooth">tooth()</a> ###


<pre><code>
tooth() = 1..32
</code></pre>

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#alert-1">alert/1</a></td><td>Given a list of <code>PocketDepths</code>, return the list of <code>ProblemTeeth</code>.</td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="alert-1"></a>

### alert/1 ###

<pre><code>
alert(PocketDepths::[<a href="#type-pocket_depth">pocket_depth()</a>]) -&gt; ProblemTeeth::[<a href="#type-tooth">tooth()</a>]
</code></pre>
<br />

Given a list of `PocketDepths`, return the list of `ProblemTeeth`.
A tooth is _problematic_ iff any pocket measurement is `>= 4`.

