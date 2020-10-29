---
layout: default
title: Home
id: home
redirect_from: "/en"
permalink: /
---

<div>
  <p>
    <b>Maxime Vaillancourt 👨‍💻</b>
  </p>

  <p>
    Hello! I work on the storefront team at <a target="_blank" rel="noopener" href="https://www.shopify.ca/">Shopify</a>, where I'm a senior software developer. I care about empowering engineering teams and building software that respects people. Areas of interest include digital well-being, privacy, sustainability, and note-taking. My pronouns are he/him. I'm active on <a title='GitHub' rel="me" target="_blank" rel="noopener" href="https://github.com/maximevaillancourt/">GitHub</a> and <a title='Twitter' rel="me" target="_blank" rel="noopener" href="https://twitter.com/vaillancourtmax">Twitter</a> (direct messages are open 👋) 
  </p>

  <div>
    <div class="grid-element">
      <p><b>Podcast appearances 🎙️</b></p>

      {% assign podcast_limit = 2 %}
      {% for podcast in site.data.podcasts limit: podcast_limit %}
      <div class="list-entry">
        <div><a target="_blank" rel="noopener" href="{{ podcast.url }}">{{ podcast.name }}</a> <span class="faded">({{ podcast.date | date: "%Y-%m-%d" }})</span></div>
        <div>{{ podcast.description_html }}</div>
      </div>
      {% endfor %}

      {% assign additional_podcasts = site.data.podcasts.size | minus: podcast_limit %}
      {% if additional_podcasts > 0 %}
      <div>
        <p>
          <a class="internal-link" href="/podcasts">
            View all podcasts ({{ additional_podcasts }} more podcasts)
          </a>
        </p>
      </div>
      {% endif %}
    </div>

    <div class="grid-element">
      <p><b>Blog 📝</b></p>
      {% assign post_limit = 7 %}
      {% for post in site.posts limit: post_limit %}
      <div class="list-entry">
        <div><a class="internal-link" href="{{ post.url }}">{{ post.title }}</a> <span class="faded">({{ post.date | date: "%Y-%m-%d" }})</span></div>
        <div>{{ post.excerpt }}</div>
      </div>
      {% endfor %}
      <p>
        <a class="internal-link" href="/blog">I wrote {{ site.posts.size | minus: post_limit }} more posts</a>.
        This blog is also available as <a class="internal-link" target="_blank" href="/rss.xml">RSS</a> and <a class="internal-link" target="_blank" href="/feed.json">JSON</a> feeds.
      </p>
    </div>

    <div class="grid-element">
      <p><b>Side projects 👨‍💻</b></p>

      {% assign project_limit = 4 %}
      {% for project in site.data.projects limit: project_limit %}
      <div class="list-entry">
        <div><a target="_blank" rel="noopener" href="{{ project.url }}">{{ project.name }}</a> <span class="faded">({{ project.date | date: "%Y-%m-%d" }})</span></div>
        <div>{{ project.description_html }}</div>
      </div>
      {% endfor %}

      {% assign additional_projects = site.data.projects.size | minus: project_limit %}
      {% if additional_projects > 0 %}
      <div>
        <p>
          <a class="internal-link" href="/projects">
            View all projects ({{ additional_projects }} more projects)
          </a>
        </p>
      </div>
      {% endif %}
    </div>

    <div class="grid-element">
      <p><b>Notes 👨‍💻</b></p>
      {% include notes_graph.html %}

      {% assign notes = site.notes | where_exp: "item", "item.path contains 'notes'" | sort: "last_modified_at" | reverse %}
      {% assign notes_limit = 5 %}
      {% for entry in notes limit: notes_limit %}
      {% unless entry.path contains "index.md" or entry.path contains "index.html" %}
      <div class="list-entry">
        <div><a class="internal-link" href="{{ entry.url }}">{{ entry.title }}</a> <span class="faded">({{ entry.last_modified_at | date: "%Y-%m-%d" }})</span></div>
      </div>
      {% endunless %}
      {% endfor %}

      {% assign additional_notes = notes.size | minus: notes_limit | minus: 1 %}
      {% if additional_notes > 0 %}
      <div>
        <p>
          <a class="internal-link" href="/notes">
            View all notes ({{ additional_notes }} more notes)
          </a>
        </p>
      </div>
      {% endif %}
    </div>

    <div class="grid-element">
      <p><b>Bookshelf 📚</b></p>

      {% assign book_limit = 3 %}
      {% assign reviews = site.bookshelf | sort: "finished_reading_on" | reverse %}
      {% for review in reviews limit: book_limit %}
      {% unless review.path contains "index.md" or review.path contains "index.html" %}
      <div class="list-entry">
        <div><a class="internal-link" href="{{ review.url }}">{{ review.title }} ({{ review.author }})</a> <span
            class="faded">({{ review.finished_reading_on | date: "%Y-%m-%d" }})</span></div>
      </div>
      {% endunless %}
      {% endfor %}

      {% assign additional_books = site.bookshelf.size | minus: book_limit | minus: 1 %}
      {% if additional_books > 0 %}
      <div>
        <p>
          <a class="internal-link" href="/bookshelf">
            View all books ({{ additional_books }} more books)
          </a>
        </p>
      </div>
      {% endif %}
    </div>
  </div>
</div>
