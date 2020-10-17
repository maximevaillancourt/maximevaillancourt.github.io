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
      {% assign post_limit = 6 %}
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
      <b>Podcast</b>
      <div>
        <audio data-theme="night" data-src="https://changelog.com/podcast/416/embed" src="https://cdn.changelog.com/uploads/podcast/416/the-changelog-416.mp3" preload="none" class="changelog-episode" controls></audio><p><a href="https://changelog.com/podcast/416">The Changelog 416: Shopify’s massive storefront rewrite</a> – Listen on <a href="https://changelog.com/">Changelog.com</a></p><script async src="//cdn.changelog.com/embed.js"></script>
      </div>

      <div>
        <iframe src="https://anchor.fm/randomly-typed/embed/episodes/27---Dial-up-Modems-ebnvoq/a-a1o3hti" height="102px" width="400px" frameborder="0" scrolling="no"></iframe>
      </div>
    </div>

    <div class="grid-element">
      <b>Side projects 👨‍💻</b>

      {% assign project_limit = 2 %}
      {% for project in site.data.projects limit: project_limit %}
      <div class="super">{{ project.date | date: "%B %Y" }}</div>
      <div class="blog-entry">
        <div><a target="_blank" rel="noopener" href="{{ project.url }}">{{ project.name }}</a></div>
        <div class="sub">{{ project.description_html }}</div>
      </div>
      {% endfor %}
      <div class="sub">
        <p>
          <a class="internal-link" href="/projects">
            View all projects ({{ site.data.projects.size | minus: project_limit }} more projects)
          </a>
        </p>
      </div>

      <br>

      <b>Notes 📘</b>
      <p class="sub">I'm experimenting with maintaining a public graph of notes to foster an environment where thoughts collide, in a way that I can build upon the combination of ideas.</p>

      {% assign notes = site.notes | where_exp: "item", "item.path contains '.md'" | sort: "date" | reverse %}
      {% assign notes_limit = 3 %}
      {% for entry in notes limit:notes_limit %}
        {% assign currentdate = entry.last_modified_at | date: "%B %Y" %}
        {% if currentdate != date %}
          {% assign date = currentdate %}
          <div class="super">Last updated in {{ date }}</div>
        {% endif %}
        <div class="blog-entry">
          <a class="internal-link" href="{{ entry.url }}">{{entry.title | replace: '_notes', '/notes' }}</a>
          <div class="sub">{{ entry.excerpt | strip_html }}</div>
        </div>
      {% endfor %}
      <div class="sub">
        <p>
          <a class="internal-link" href="/notes">
            View all notes ({{ notes.size | minus: notes_limit }} more notes)
          </a>
        </p>
      </div>
    </div>
  </div>
</div>
