# merkur
[Merkur](https://merkur.herokuapp.com/) is a Rails application built from 4 students enrolled in the Full Stack Web Development course at [Le Wagon coding bootcamp](https://www.lewagon.com). The purpose of this project was to clone Airbnb.

This web application is built on Ruby on Rails with Ruby, HTML, CSS, & Javascript


## Web Stack

* Github
* Ruby on Rails
* PostgreSQL
* Heroku

## Libraries

* Devise (authentication)
* Cloudinary
* Geocoding with Mapbox
* Flatpickr
* PG Search
* Bootstrap
* AJAX in Rails

## Install

### Clone the repository

```shell
git clone git@github.com:danburck/merkur.git
cd project
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 2.5.1`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 2.5.1
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
bundle && yarn
```


### Initialize the database

```shell
rails db:create db:migrate db:seed
```

### Add heroku remotes

Using [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli):

```shell
heroku git:remote -a project
heroku git:remote --remote heroku-staging -a project-staging
```

## Serve

```shell
rails s
```

## Deploy

### With Heroku pipeline (recommended)

Push to Heroku staging remote:

```shell
git push heroku-staging
```

Go to the Heroku Dashboard and [promote the app to production](https://devcenter.heroku.com/articles/pipelines) or use Heroku CLI:

```shell
heroku pipelines:promote -a project-staging
```

### Directly to production (not recommended)

Push to Heroku production remote:

```shell
git push heroku
```

## Team
<a href="https://github.com/danburck" target="_blank">
  <img src="https://avatars.githubusercontent.com/u/33006856?s=120&v=4" width="60px" height="60px">
</a>
<a href="https://github.com/d-tello" target="_blank">
  <img src="https://avatars.githubusercontent.com/u/71888404?v=4" width="60px" height="60px">
</a>
<a href="https://github.com/gitovska" target="_blank">
  <img src="https://avatars.githubusercontent.com/u/76232964?s=120&v=4" width="60px" height="60px">
</a>
<a href="https://github.com/Uschi760" target="_blank">
  <img src="https://avatars.githubusercontent.com/u/11859957?s=120&v=4" width="60px" height="60px">
</a>


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.
