# lab-10

**Create a personalized inbox for each user**

In this lab, you will customize your application so that each signed-in user sees only the chats they participate in. You will also enforce access control using CanCanCan and extract logic using model scopes.

---

## Instructions

### 1. Show only relevant chats for the signed-in user

When a user visits `/chats`, they should only see the chats where they are either the sender or the receiver.

To implement this, you must define un **scope** en tu modelo `Chat`.

---

#### 💡 What is a scope?

A **scope** is a way to define custom queries that you can reuse throughout your Rails application. Scopes are defined inside a model and help keep your controllers clean and readable.

A basic example:

```ruby
# In app/models/post.rb
class Post < ApplicationRecord
  scope :published, -> { where(published: true) }
end
```

Then, in your controller or view, you can use it like this:

```ruby
@posts = Post.published
```

This is equivalent to `Post.where(published: true)`, but much easier to reuse and understand.

---

For this lab, define a scope in your `Chat` model that allows you to retrieve all chats where a given user is either the sender or the receiver. Use that scope in your controller to populate the inbox.

---

### 2. Restrict access to chats using CanCanCan

Users should **only be able to view chats in which they are participants**. You must define this rule using **CanCanCan**.

Update your `Ability` class to give users permission to `:read` only the chats where they are involved.

Use CanCanCan's `load_and_authorize_resource` or a similar mechanism in your controller to apply this rule.

> ⚠️ Do not manually check the current user in the controller. The authorization must be handled by CanCanCan.

---

### 3. Add a link to "My Inbox"

In your main navigation (layout), add a link labeled **"My Inbox"** that leads to the chat list.

Only show this link if a user is signed in.

---

### 4. Show the other participant's name

In the chat list (`chats#index`), for each chat, display the name of the **other user** in the conversation.

You’ll need to define a method in the `Chat` model that, given the current user, returns the other participant.

Use that method in the view to display their full name.

---

### 5. Bonus (optional): Hide or restrict `/users`

As a bonus, you can hide the full user list from regular users. You may choose to show it only to admins, or redirect regular users to their inbox or profile.

---

### Testing

To test your implementation, log in with different users and verify that:

- The inbox shows only their chats
- They cannot access chats where they are not participants
- CanCanCan correctly blocks unauthorized access
- The UI clearly shows who the other person in each chat is
