---
layout: default
title: Blog archives
permalink: /blog
---

<div>
  <div class="post-heading">
    <h1 class="post-title">All blog posts 📝</h1>
  </div>
  {% for post in site.posts %}
    {% assign currentdate = post.date | date: "%B %Y" %}
    {% if currentdate != date %}
      {% assign date = currentdate %}
      <div class="super">{{ date }}</div>
    {% endif %}
      <div class="blog-entry">
        <div><a class="internal-link" href="{{ post.url }}">{{ post.title }}</a></div>
        <div class="sub">{{ post.excerpt | strip_html }}</div>
      </div>
  {% endfor %}
  <br>
  <div class="sub"><p>This blog is also available as <a class="internal-link" target="_blank" href="/rss.xml">RSS</a> and <a class="internal-link" target="_blank" href="/feed.json">JSON</a> feeds.</p></div>
</div>
