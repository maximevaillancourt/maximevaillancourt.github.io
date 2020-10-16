---
title: Automatically labeling GitHub notification emails with Gmail filters
layout: post
slug: "github-email-notifications-gmail-filters"
excerpt: Cut through the noise and identify what's important.
image: /assets/github-labels.png
---

A fair share of my waking hours involves communicating with other people on GitHub to make sure we're solving the right problems, and that we're solving them the right way.

As a result, I receive many email notifications about various things that happen on there: <span style="color: #e30000;">direct requests to review a particular piece of code</span>, <span style="color: blue;">feedback on pull requests I've opened</span>, <span style="color: green;">pull requests merged by their authors</span>, <span style="color: #c6ad16;">people directly mentioning our username in a comment</span>, <span style="color: grey;">issues closed by their authors</span>, etc. I receive hundreds of emails every single week.

Now here's the thing: some of these emails are more time-sensitive and/or actionable than others. We should probably address <span style="color: #e30000;">direct requests to review a particular piece of code</span> first, since someone is explicitly asking for our attention and not responding promptly would likely prevent them from shipping something swiftly. Conversely, I'll want to delete (or at least deprioritize) email notifications communicating that a given <span style="color: green;">pull request was merged by its author</span> - there's no actionable to derive from it, so in the bin it goes.

However, by default, all these email notifications arrive in our inboxes with the same perceived level of importance, which makes it difficult to identify what I should address next.

**This post presents a solution to this problem**: using Gmail filters, we can automatically add labels to GitHub notification emails based on their content. This solution takes less than 10 minutes to implement, and the long-term return on investment is quite appreciable.

Here's how my inbox looks like with automatic labeling set up:

![](/assets/github-labels.png)

Pretty neat, right? Thanks for these labels, I'm able to quickly parse through emails and reach inbox zero every day.

Let's see how to implement this solution with Gmail.

## 1. Download the XML filters template

Start by saving the following XML filters template to a file on your device:

```
<?xml version='1.0' encoding='UTF-8'?>
<feed xmlns='http://www.w3.org/2005/Atom' xmlns:apps='http://schemas.google.com/apps/2006'>
  <title>GitHub filters</title>
  <entry>
    <category term='filter'></category>
    <content></content>
    <apps:property name='hasTheWord' value='Merged into'/>
    <apps:property name='label' value='Merged'/>
    <apps:property name='sizeOperator' value='s_sl'/>
    <apps:property name='sizeUnit' value='s_smb'/>
  </entry>
  <entry>
    <category term='filter'></category>
    <content></content>
    <apps:property name='hasTheWord' value='&quot;@<YOUR_GITHUB_USERNAME_HERE>&quot;'/>
    <apps:property name='label' value='Mention'/>
    <apps:property name='sizeOperator' value='s_sl'/>
    <apps:property name='sizeUnit' value='s_smb'/>
  </entry>
  <entry>
    <category term='filter'></category>
    <content></content>
    <apps:property name='hasTheWord' value='because you authored the thread'/>
    <apps:property name='label' value='Author'/>
    <apps:property name='sizeOperator' value='s_sl'/>
    <apps:property name='sizeUnit' value='s_smb'/>
  </entry>
  <entry>
    <category term='filter'></category>
    <content></content>
    <apps:property name='hasTheWord' value='modified the open/close state'/>
    <apps:property name='label' value='Reopened'/>
    <apps:property name='sizeOperator' value='s_sl'/>
    <apps:property name='sizeUnit' value='s_smb'/>
  </entry>
  <entry>
    <category term='filter'></category>
    <content></content>
    <apps:property name='hasTheWord' value='&quot;requested review from @<YOUR_GITHUB_TEAM_NAME_HERE>&quot;'/>
    <apps:property name='label' value='Team review request'/>
    <apps:property name='sizeOperator' value='s_sl'/>
    <apps:property name='sizeUnit' value='s_smb'/>
  </entry>
  <entry>
    <category term='filter'></category>
    <content></content>
    <apps:property name='hasTheWord' value='&quot;because you are on a team that was mentioned&quot; AND &quot;You can view, comment on, or merge this pull request online at&quot;'/>
    <apps:property name='label' value='Team review request'/>
    <apps:property name='sizeOperator' value='s_sl'/>
    <apps:property name='sizeUnit' value='s_smb'/>
  </entry>
  <entry>
    <category term='filter'></category>
    <content></content>
    <apps:property name='from' value='github'/>
    <apps:property name='hasTheWord' value='&quot;Closed \#&quot; &quot;You are receiving this because&quot;'/>
    <apps:property name='doesNotHaveTheWord' value='dependabot'/>
    <apps:property name='label' value='Closed'/>
    <apps:property name='sizeOperator' value='s_sl'/>
    <apps:property name='sizeUnit' value='s_smb'/>
  </entry>
  <entry>
    <category term='filter'></category>
    <content></content>
    <apps:property name='hasTheWord' value='&quot;requested your review on&quot;'/>
    <apps:property name='label' value='Direct review request'/>
    <apps:property name='sizeOperator' value='s_sl'/>
    <apps:property name='sizeUnit' value='s_smb'/>
  </entry>
</feed>
```

## 2. Edit the template with your information

In the template, replace the following string:

- `@<YOUR_GITHUB_USERNAME_HERE>` (in my case that would be `@maximevaillancourt`)

If you're part of a GitHub team that other people mention in issues and pull requests, also replace the following string:

- `@<YOUR_GITHUB_TEAM_NAME_HERE>` (for example, `@my-organization/best-team-ever`)

If you're not part of a GitHub team, remove the `<entry>` node that looks for this pattern.

Finally, save the XML file.

## 3. Import the XML filters in Gmail

Now that your template is ready, it's time to import it in your Gmail account.

Open up your Gmail settings, and click on the "Filters" tab. Once you're there, find the "Import filters" link near the bottom of the pane. Select the XML file you just modified and upload it. Review the filters and and confirm the import.

That's it - you're done. At this point, your emails should be labeled automatically. Feel free to change the colors of the labels via the "Labels" tab in your Gmail settings. I find it helpful to make <span style="color: #e30000;">direct review requests</span> red as this means "urgent and important" to me, and the label for <span style="color: green;">merged pull requests</span> is green because it means "success, everything's good" to me.

Experiment to find what works best for you.

If you found this helpful, consider sharing it with your coworkers and friends. I'm always available on Twitter ([@vaillancourtmax](https://twitter.com/vaillancourtmax)) to discuss. ✌️
