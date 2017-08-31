

# Module dates #
* [Description](#description)
* [Function Index](#index)
* [Function Details](#functions)

Etudes for Erlang: 5-2, 6-3.

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#date_parts-1">date_parts/1</a></td><td>Given a <code>String</code> of the form "YYYY-MM-DD" return the date <code>Parts</code>.</td></tr><tr><td valign="top"><a href="#julian-1">julian/1</a></td><td>Given a <code>String</code> of the form "YYYY-MM-DD" return the <code>JulianDate</code>.</td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="date_parts-1"></a>

### date_parts/1 ###

<pre><code>
date_parts(String::string()) -&gt; Parts::[integer()]
</code></pre>
<br />

Given a `String` of the form "YYYY-MM-DD" return the date `Parts`.

```
  [Year, Month, Day] = Parts.
```

<a name="julian-1"></a>

### julian/1 ###

<pre><code>
julian(String::string()) -&gt; JulianDate::non_neg_integer()
</code></pre>
<br />

Given a `String` of the form "YYYY-MM-DD" return the `JulianDate`.

__See also:__ [date_parts/1](#date_parts-1).

