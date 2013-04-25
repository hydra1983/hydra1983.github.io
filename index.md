---
layout: default
title: Home
group: navigation
sort: 10
---
{% include JB/setup %}

{% for post in site.posts limit:4 %}
<div class="row">
  <div class="span8">
    <div class="page-header">
      <h2> 
        <a href="{{ BASE_PATH }}{{ post.url }}" rel="bookmark" title="Permanent link to ">{{ post.title }}</a>
        {% if post.tagline %}
          <small>{{ post.tagline }}</small>
        {% endif %}
      </h2>
      <span>{{ post.date | date: '%B' }} {{ post.date | date: '%e' }}, {{ post.date | date: '%Y' }}</span> 
    </div>
    <div>
      {% if post.description and post.description != empty %}
        {{ post.description }}
      {% else %}
        {{ post.content }}
      {% endif %}
    </div>
  </div>
</div>
{% endfor %}