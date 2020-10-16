---
title: "Accelerating software onboarding with code walkthroughs"
layout: post
slug: "code-walkthroughs"
excerpt: Welcoming newcomers with high-quality, high-context code comments.
image: https://images.unsplash.com/photo-1573166613605-3b4dfcbf1268?ixlib=rb-1.2.1&auto=format&fit=crop&w=1498&h=500&q=80
---

<img src="{{ page.image }}"/>

*By the end of this article, you'll have a new tool in your toolbox to help newcomers quickly discover how your software project works, while reducing the time you explicitly spend introducing new folks to your project.*

---

**Ramping up on a new software project is hard**, both for the person ramping up and for the team that supports this person's onboarding process. It's especially worse when multiple people start onboarding the same project at the same time, which happened to my team recently: our project's area of influence has grown quickly recently, and as a result, we're seeing dozens of developers starting to contribute to the project.

This sudden spike in interest lead to what I call "onboarding load" for our core team, as we suddenly faced pressure to help newcomers learn and navigate the codebase, while simulteanously trying to keep up with our day-to-day tasks.

### Deflecting pressure

To reduce this pressure on our core team, I recently introduced a "code walkthrough" in the project's codebase. It's essentially a collection of high-quality, high-context code comments "tagged" with a `[docs/walkthrough]` line comment. When newcomers come our way and want to learn more about our project, I point them to a GitHub search for that special identifier in the project's codebase to pull up all those great code comments to learn about the project. (They could also clone the code locally and search for that identifier using their code editor, but a GitHub search is available to everyone.)

Here are some examples of such high-context comments and the different purposes they serve:

**Navigation and flow**

```
# [docs/walkthrough]
# This module is responsible for generating the content to insert in the <head>
# HTML tag across all pages.
```

```
# [docs/walkthrough]
# This class is the entrypoint to all output generation. From here, content
# flows down into controllers, then into serializers and formatters.
```

**Performance**

```
# [docs/walkthrough]
# This is an example of an implementation that doesn't feel like it's the
# right way to do it, but after looking at profiles and traces, we know
# that this implementation performs better than a SQL-only solution.
#
# There's currently no good index on the `xyz` table to quickly search
# for nested values, so it ends up being faster to filter through all
# values in Ruby than it is to filter those out using a `WHERE`
# clause at the database level. We're looking into remodeling this data.
```

**Trivia**

```
# [docs/walkthrough]
# Even though this class usually handles objects of type X, this one
# is an exception because it can be overridden by people manually creating
# resource of the same name.
```

**Resiliency**

```
# [docs/walkthrough]
# Historically, we kept track of the resource count by incrementing a value in a
# key-value store whenever a resource was created. However, because of scaling
# constraints, we started tracking this value using a proper data ETL process.
# We now simply read the count from that data store and cache it aggressively.
```

**Implementation**

```
# [docs/walkthrough]
# By default, this class (including its subclasses) doesn't expose any method
# to the outside world. To do so, methods must be marked with the "world_public" 
# identifier. This is a safe-by-default way to avoid allocating wrapper objects,
# while still allowing public methods to be created for internal use.
```

The benefit of this approach is that the documentation is built into the code, so the risk that it becomes stale or outdated is much lower than if that documentation lived outside of the code itself.

One thing you can play around with is moving up and down levels of abstraction throughout the comments. Some of them may explain why a specific function is implemented this way, while others may explain the business domain history behind this legacy module.

### Sounds great! How do I get started?

As a starting point, identify existing high-quality comments in your project, and tag them with the special identifier of your choice. Then, look for areas in the codebase that would benefit from having a little bit more context and documentation, and take some time to write clear, helpful comments that you can add that special tag to. Finally, once you have a generous collection of high-quality comments with that special identifier, start pointing newcomers to search for this identifier, and let them soak up all that context.

As the documentation shepherd on your team, always be on the lookout for opportunities to write more of those high-context code comments: you'll be rewarded for it in the future, either by your colleagues thanking you for writing those comments that helped them step up quickly, or by your boss for reducing the "onboarding load" I mentioned earlier on the rest of the team, who instead were able to focus on the task at hand.

Great software documentation is like a flywheel. It's hard to write at first, and the return on investment is not immediately visible. But with time, it compounds, and eventually, you'll wonder how you managed to live without it.

What are some of ways you're helping people onboard your software development team? Reply on Twitter here:

<p>
<blockquote class="twitter-tweet"><p lang="en" dir="ltr">Ramping up on a new software project is hard. It doesn&#39;t have to be.<br><br>To help newcomers, I recently added high-context code comments and tagged them using a special identifier to make it easy to find them all. 🎉<br><br>Actual examples in the post! 👇<a href="https://t.co/EivfXt7rrz">https://t.co/EivfXt7rrz</a></p>&mdash; Maxime Vaillancourt (@vaillancourtmax) <a href="https://twitter.com/vaillancourtmax/status/1288097090585993216?ref_src=twsrc%5Etfw">July 28, 2020</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
</p>
