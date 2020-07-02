---
layout: default
title: Projects
permalink: /projects
---

<div>
  <div class="post-heading">
    <h1 class="post-title">All projects 👨‍💻</h1>
  </div>

  {% for project in site.data.projects limit: project_limit %}
  <div class="super">{{ project.date | date: "%B %Y" }}</div>
  <div class="blog-entry">
    <div><a target="_blank" rel="noopener" href="{{ project.url }}">{{ project.name }}</a></div>
    <div class="sub">{{ project.description_html }}</div>
  </div>
  {% endfor %}
</div>
