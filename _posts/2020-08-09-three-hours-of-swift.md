---
title: "Three hours of Swift"
layout: post
slug: "three-hours-of-swift"
excerpt: What I learned during my initial exploration of iOS development.
image: https://images.unsplash.com/photo-1537498425277-c283d32ef9db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&h=400&q=80
---

<img src="{{ page.image }}" />

I took three hours this morning to build the foundation of the iOS app for [Freshreader](https://freshreader.app). This was my first time writing Swift and seriously using Xcode (compared to opening it by mistake when trying to launch Visual Studio Code through Spotlight).

To document my learning journey, I thought I'd start taking more notes and share them in public so everyone can benefit from them. Without further ado, here's what I learned in those three hours of discovering Swift:

### SwiftUI is super intuitive

I would go as far as writing that SwiftUI is delightful to use. Building layouts is easy. Tweaking text styling is obvious. Once you understand the building blocks, everything makes sense.

### String interpolation syntax

The string interpolation syntax in Swift is `"\(variable)"`. This is the first time I see the backslash used as the starting token for string interpolation.

### Function parameters can have two names

Function parameters can have up to two names: an internal one and an external one. This means that you can use one name to refer to the argument in the function implementation, but callers of that function will supply the argument using the external name. An example:

```swift
func increment(by amount: Int) {
    count += amount
}
```

Notice that in the function body, we use the `amount` name. However, when calling the function, we'll use the `by` name:

```swift
increment(by: 5)
```

Both `by` and `amount` refer to the same value here (`5`), but it's referred to by different names depending on whether we're in the context of the function implementation, or outside the function as a caller.

Using two names is not mandatory, but it's the first time I saw this concept of internal and external names for a single function parameter. Neat!

---

After just 3 hours of stumbling around and feeling my way through Swift, the iOS app for Freshreader is coming along pretty well already, which is encouraging. I simply implemented the reading list so far (which actually talks to the API, so this is real data from a production account):

![image](https://user-images.githubusercontent.com/8457808/89737725-44c96480-da41-11ea-97bc-6108dd414186.png)

There's still a lot to do though:

- Add a login screen (to save the account number)
- Implement a "Slide to mark item as read" gesture
- Handle errors
- Add test coverage for ApiService and general app behavior

I [livestreamed these three hours on Twitch this morning](https://www.twitch.tv/maximevaillancourt), and intend to do so every weekend if possible, while continuing to take notes as I go to document my learnings.

Learning in public is fun!

_(normalize failing in public!)_ ✊
