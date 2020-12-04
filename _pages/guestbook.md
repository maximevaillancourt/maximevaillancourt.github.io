---
layout: default
title: Guestbook
permalink: /guestbook
---

<h1>{{ page.title }} 📖</h1>

That's right &mdash; just like in the early days of the Web. A good old guestbook.

Leave a message of your own at the bottom of this page. Thanks for stopping by! 👋

{% for message in site.data.guestbook_messages reversed %}
  <div class="guestbook-entry">
    <div class="guestbook-entry-author"><span style="font-weight: bold;">{{ message.author }}</span> ({{ message.timestamp | date: "%Y-%m-%d" }})</div>
    <div class="guestbook-entry-body">{{ message.body }}</div>
  </div>
{% endfor %}


<div class="guestbook-signature-wrapper">

  <h2 style="margin-top: 0.5em;" >Sign the guestbook</h2>

  <form action="/submitted" name="guestbook" netlify netlify-honeypot="not-for-humans">
    <p style="display: none;">
      <label>Don’t fill this out if you're human: <input name="not-for-humans" /></label>
    </p>
    <p>
      <label>Name<br><input placeholder="Your name..." type="text" name="name" /></label>
    </p>
    <p>
      <label>Message<br><textarea name="message" placeholder="Your message..."></textarea></label>
    </p>
    <p>
      <button type="submit">Submit</button>
    </p>
  </form>

</div>
