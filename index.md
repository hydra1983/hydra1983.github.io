---
layout: page
title: Latest
group: navigation
sort: 10
---
{% include JB/setup %}

<div class="row">
  <div class="span8">
    <div class="posts">
      {% for post in site.posts limit:10 %}
        <div class="row" style="margin-bottom:40px;">
          <div class="span8">
            <article class="post">
              <header>
                <h2> 
                  <a href="{{ BASE_PATH }}{{ post.url }}" rel="bookmark" title="Permanent link to ">{{ post.title }}</a>
                  {% if post.tagline %}
                    <small>{{ post.tagline }}</small>
                  {% endif %}
                </h2>
                <hr style="margin:0;"/>
                <div class="date">{{ post.date | date: '%B' }} {{ post.date | date: '%e' }}, {{ post.date | date: '%Y' }}</div>     
              </header>
              <div>
                {% if post.description and post.description != empty %}
                  {{ post.description }}
                {% else %}
                  {{ post.content }}
                {% endif %}
              </div>
            <article>
          </div>
        </div>
      {% endfor %}
    </div>
  </div>
</div>