

# Module people #
* [Description](#description)
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)

Etudes for Erlang: 7-2.

<a name="types"></a>

## Data Types ##




### <a name="type-age">age()</a> ###


<pre><code>
age() = pos_integer()
</code></pre>




### <a name="type-gender">gender()</a> ###


<pre><code>
gender() = 77 | 70
</code></pre>




### <a name="type-name">name()</a> ###


<pre><code>
name() = string()
</code></pre>




### <a name="type-person">person()</a> ###


<pre><code>
person(Gender) = {<a href="#type-name">name()</a>, Gender, <a href="#type-age">age()</a>}
</code></pre>




### <a name="type-person">person()</a> ###


<pre><code>
person() = {<a href="#type-name">name()</a>, <a href="#type-gender">gender()</a>, <a href="#type-age">age()</a>}
</code></pre>

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#male_or_over_40-0">male_or_over_40/0</a></td><td>Return the list of people in <code>?PEOPLE</code> who are male _or_ over 40.</td></tr><tr><td valign="top"><a href="#males_over_40-0">males_over_40/0</a></td><td>Return the list of males over 40 in <code>?PEOPLE</code>.</td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="male_or_over_40-0"></a>

### male_or_over_40/0 ###

<pre><code>
male_or_over_40() -&gt; [<a href="#type-person">person()</a>]
</code></pre>
<br />

Return the list of people in `?PEOPLE` who are male _or_ over 40.

<a name="males_over_40-0"></a>

### males_over_40/0 ###

<pre><code>
males_over_40() -&gt; [<a href="#type-person">person</a>(77)]
</code></pre>
<br />

Return the list of males over 40 in `?PEOPLE`.

