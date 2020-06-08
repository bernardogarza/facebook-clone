# Facebook Clone

This project was created using Ruby on Rails and PostgreSQL. It's a Facebook clone where you can add friends, write posts, comment and like other user's posts. We used Omniauth for Facebook authentication and Devise for regular authentication.

## Authors
**[Bernardo Garza Landa](https://bernardogarza.me/)** - bernardo.g.landa@gmail.com - [Portfolio](https://bernardogarza.me) - [LinkedIn](https://www.linkedin.com/in/bernardo-g-landa/)

**[Kalib Hackin](naguihw@gmail.com)** - naguihw@gmail.com

## Live Demo
https://microverse-facebook-clone.herokuapp.com/users/sign_in

## Screenshot
![Facebook Clone](screenshot.png?raw=true "Facebook Clone")
![Facebook Clone](screenshot2?raw=true "Facebook Clone")

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

## Run tests
To run the tests, in your terminal you have to execute the following code:
```
bundle exec rspec
```

## Future features
- Add better styling
- Implement chat

## Built with
- Ruby on Rails
- MySQL
- Bootstrap
- Rspec
