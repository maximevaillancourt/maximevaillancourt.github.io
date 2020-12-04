---
layout: default
title: Guestbook
permalink: /guestbook
---

<h1>{{ page.title }}</h1>

That's right &mdash; just like in the early days of the Internet. Leave a kind message below!

<form name="guestbook" netlify>
  <p>
    <label>Name<br><input type="text" name="name" /></label>
  </p>
  <p>
    <label>Message<br><textarea name="message"></textarea></label>
  </p>
  <p>
    <button type="submit">Submit</button>
  </p>
</form>

