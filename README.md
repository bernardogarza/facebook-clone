# Facebook Clone

This project was created using Ruby on Rails and PostgreSQL, it's a facebook clone where you can add freidns, write posts, comment and like other user's posts. We used Omniauth for facebook authentication and Devise for regular authentication.


## Authors
**[Bernardo Garza Landa](https://github.com/bernardogarza)** - bernardo.g.landa@gmail.com


**[Kalib Hackin](naguihw@gmail.com)** - naguihw@gmail.com


## Live Demo

https://microverse-facebook-clone.herokuapp.com/users/sign_in


## Screenshot


![Facebook Clone](screenshot.png?raw=true "Facebook Clone")




## Getting started

To get started with the app clone the repo and run the following commands:

```
$ bundle install --without production
```

Create the database:

```
$ rails db:create
```

Migrate the database:

```
$ rails db:migrate
```

Create the fake users:

```
$ rails db:seed
```

Run the app in a local server:

```
$ rails server
```
