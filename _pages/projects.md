---
layout: default
title: Projects
permalink: /projects
---

<div>
  <div class="post-heading">
    <h1 class="post-title">All projects 👨‍💻</h1>
  </div>

  {% for project in site.data.projects %}
  <div>{{ project.date | date: "%B %Y" }}</div>
  <div class="list-entry">
    <div><a target="_blank" rel="noopener" href="{{ project.url }}">{{ project.name }}</a></div>
    <div>{{ project.description_html }}</div>
  </div>
  {% endfor %}
</div>
