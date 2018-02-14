# Codaisseruify

A rails app manages a collection of songs and their associated artists.

This app, which is deployed with Heroku, is built to learn how to use PostgreSQL database and AJAX, write model and integration tests using [Rspec] (https://github.com/rspec/rspec), [FactoryGirl] (https://github.com/kenoir/factory_girl_rails), upload files with [CarrierWave] (https://github.com/carrierwaveuploader/carrierwave) and [Cloudiary] (https://github.com/cloudinary/cloudinary_gem)

<img width="500" alt="screen shot 2018-02-14 at 13 39 04" src="https://user-images.githubusercontent.com/32798242/36206294-28125704-1192-11e8-8b98-fbeb7f365d1c.png">
<img width="500" alt="screen shot 2018-02-14 at 13 43 39" src="https://user-images.githubusercontent.com/32798242/36206296-295c74aa-1192-11e8-8515-8b02279d7f6a.png">

## Steps
1. Generate the App
2. Design model & database structure and define relationships between models
3. Create initial seed data
4. Create controllers & views for artists overview and show pages
5. Style the app with Bootstrap 
6. Write model tests using Rspec, FactoryGirl & Faker
7. Deploy the app via Heroku (https://morning-refuge-58005.herokuapp.com/)
8. Add AJAX allowing visitors to add, remove and delete songs in the show page
9. Write integration tests for AJAX-related functionalities

Note: My commits for step 1-7 are pushed to another repo (https://github.com/fandytcc/codaisseurify) 

## Model/ Database Structure
| Artist    | Type   | Description   |
|-----------|--------|---------------|
| first_name| string | First name    |
| last_name | string | Last name     |
| bio       | text   | Biography     |

| Song      | Type   | Description   |
|-----------|--------|---------------|
| title     | string | Song title    |
| artist_id | bigint | reference     |
| selected  | boolean| selected song |

| Photo      | Type   | Description  |
|-----------|--------|---------------|
| image     | string | Artist's photo|
| artist_id | bigint | reference     |

User model was created by using [Devise] (https://github.com/RailsApps/rails-devise).

## Running Locally
Make sure you have [Ruby](https://www.ruby-lang.org/en/) and [Bundler](http://bundler.io/) installed.

```bash
git clone git@github.com:fandytcc/codaisseruify2.git
cd codaisseruify2
bundle install
rails db:create db:migrate db:seed
rails server
```

## Related documentation

For more information about using PostgreSQL, Rspec, CarrierWave, Cloudinary and Heroku see these links:

* [PostgreSQL] (https://www.postgresql.org/)
* [CarrierWave] (https://rubygems.org/gems/carrierwave/versions/0.11.2)
* [Cloudinary] (https://cloudinary.com/)
* [Rspec] (http://rspec.info/)
* [Heroku] (https://www.heroku.com/)
