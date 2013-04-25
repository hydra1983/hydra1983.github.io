---
layout: page
title: Home
group: navigation
sort: 10
---
<ul class="nav">
  {% assign group = 'navigation' %}
  {% for node in site.pages_sorted %}
    {% if node.title != null %}
      {% if group == null or group == node.group %}
        {% if page.url == node.url %}
        <li class="active"><a href="{{ BASE_PATH }}{{node.url}}" class="active">{{node.title}}</a>{{node.sort}}</li>
        {% else %}
        <li><a href="{{ BASE_PATH }}{{node.url}}">{{node.title}}</a> {{node.sort}}</li>
        {% endif %}
      {% endif %}
    {% endif %}
  {% endfor %}
  {% assign pages_list = nil %}
  {% assign group = nil %}
</ul>