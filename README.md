
## Requirements

* Create landing page using bootstrap with the following elements:
  * Navigation bar with the following functional links:
    * Home
    * About
    * Contact
  * Home page with the following elements:
    * Title
    * Subtitle
  * About page with the following elements:
    * Title
    * Subtitle
    * Description
  * Contact page with the following elements:
    * Form with the following fields:
      * Name
      * Email
      * Message
      * Submit button
      * When the form is submitted, the application should show a message with the following text: "Thank you for your message, we will contact you soon."
  * Footer with the following elements:
    * Copyrigth
    * Social media links (not functional)

* Create 3 routes for the following pages:
  * Home -> /
  * About -> /about
  * Contact -> /contact

* Important if elements is common to all pages, you should create in layout file.
* The application should have bootstrap design.

### Submission

#### Create a repository

Create a new repository public in your github account called `lab-3`

#### Upload the code

Upload the code to the repository created in the previous step. follow the instructions below:

1. go to root folder of the project

``` bash
cd Y
```

2. Set the remote repository link

``` bash
git remote add origin git@github.com:username/lab-3.git
git branch -M main
git push -u origin main
```

#### Submit the repository link

Upload the repository link to Canvas.
=======
# lab-05

## Create your first ruby and rails models

In this evaluation, you will be asked to create the first models of your web application `Whats New` using Ruby on Rails.

## Instructions

### 1. Create models and database tables

You will have to create at least 3 independent models (and tables). Later on the course we will learn to create associations between models, for the moment all models will be independent from each other.

#### 1.1 Creation of the `User` model and database table

Create the `User` models and respective database table with at least the following attributes:

- `email` (of type `string`)
- `first_name` (type `string`)
- `last_name` (type `string`)
- `created_at`` (type`datetime`)
- `updated_at` (type `datetime`)

#### 1.2 Creation of the `Chat` model and database table

Create the `Chat` model and respective database table with the following attributes:

- `sender_id` (of type `integer`)
- `receiver_id` (type `integer`)
- `created_at` (type `datetime`)
- `updated_at` (type `datetime`)

#### 1.3 Creation of the `Message` model and database table

Create the `Message` model and respective database table with the following attributes:

- `chat_id` (type `integer`)
- `user_id` (type `integer`)
- `body` (type `text`)
- `created_at` (type `datetime`)
- `updated_at` (type `datetime`)

All attributes must be `NOT NULL` at the database level.

### 2. Create dummy data

Populate the `db/seeds.rb` file with at least 10 instances of each model. This file is used to populate the database with data using `create` statements and is executed by running `bin/rails db:seed`.
>>>>>>> 9228be619bc1eced403a1d7f1da1ea1ed829465e
