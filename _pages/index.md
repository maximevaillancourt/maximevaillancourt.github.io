---
layout: default
title: Home
id: home
redirect_from: "/en"
permalink: /
---

<div>
  <h2>👋 Hi! I'm Maxime.</h2>
  <p>
    I'm a senior software developer at <a target="_blank" rel="noopener" href="https://www.shopify.ca/">Shopify</a>, where I work on storefront performance.
  </p>

  <p class="sub">
    I'm also active on <a title='Twitter' rel="me" target="_blank" rel="noopener" href="https://twitter.com/vaillancourtmax">Twitter</a> and
    <a title='GitHub' rel="me" target="_blank" rel="noopener" href="https://github.com/maximevaillancourt/">GitHub</a>.
  </p>

  <br>

  <div class="grid">
    <div class="grid-element">
      <b>Blog 📝</b>
      {% assign post_limit = 5 %}
      {% for post in site.posts limit: post_limit %}
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
      <div class="sub">
        <p>
          <a class="internal-link" href="/blog">
            View blog archives ({{ site.posts.size | minus: post_limit }} more posts)
          </a>
        </p>
        <p>
          This blog is also available as <a class="internal-link" target="_blank" href="/rss.xml">RSS</a> and <a class="internal-link" target="_blank" href="/feed.json">JSON</a> feeds.
        </p>
      </div>
    </div>

    <div class="grid-element">
      <b>Side projects 👨‍💻</b>
      {% for project in site.data.projects %}
      <div class="super">{{ project.date | date: "%B %Y" }}</div>
      <div class="blog-entry">
        <div><a target="_blank" rel="noopener" href="{{ project.url }}">{{ project.name }}</a></div>
        <div class="sub">{{ project.description_html }}</div>
      </div>
      {% endfor %}

      <br>

      <b>Notes 📘</b>
      <p class="sub">I'm experimenting with maintaining a public graph of notes to foster an environment where thoughts collide, in a way that I can build upon the combination of ideas.</p>

      {% assign notes = site.notes | where_exp: "item", "item.path contains 'notes'" | sort:"path" %}
      {% for entry in notes limit:10 %}
        {% unless entry.path contains "index.md" or entry.path contains "index.html" %}
          {% assign currentdate = entry.last_modified_at | date: "%B %Y" %}
          {% if currentdate != date %}
            {% assign date = currentdate %}
            <div class="super">Last modified in {{ date }}</div>
          {% endif %}
            <div><a class="internal-link" href="{{ entry.url }}">{{entry.title | replace: '_notes', '/notes' }}</a></div>
        {% endunless %}
      {% endfor %}
    </div>
  </div>
</div>
