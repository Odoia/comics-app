# Marvel App

This project is a web page that shows Marvel's comics from the latest released to the older ones. It is also possible to search by characters from the comics and favorite a comic.

It uses Ruby 3.1.0 and Rails 7.0.3.

# Installation guide with Docker:

* Have Docker installed;
* Clone the project;
* Insert valid PRIVATE_KEY and PUBLIC_KEY at .env file;
* Run "source dev.sh";
* Run "dktest" to run the all tests;
* Run "dkupa" to run the project.

The project will be running at: http://localhost:3000.
It will open a login page and you need to fill with: 
* login: user01
* password: pass01

# Installation guide without Docker:

* Clone the project;
* Insert valid PRIVATE_KEY and PUBLIC_KEY at .env file;
* Run "bundle install";
* Run "rails db:create";
* Run "rails db:migrate";
* Run "rails db:seed";
* Run "rspec -fd" to run the all tests;
* Run "rails server" to run the project.

The project will be running at: http://localhost:3000
It will open a login page and you need to fill with: 
* login: user01
* password: pass01

# Application documentation

[API mind map](https://www.xmind.net/m/T6qu3a)


* ![project mid map](https://github.com/Odoia/comics-app/blob/development/public/comics-app.png)

# How it works

This application uses Marvel API (https://developer.marvel.com/docs).
* For getting all comics, it uses /v1/public/comics endpoint with the following query parameters:
  * orderBy: onsaleDate.
* For the search, it is made a search to /v1/public/characters passing 'name' as a query parameter. Once the app gets this response, it gets the first result id and make a request to /v1/public/comics endpoint with:
  * orderBy: onsaleDate;
  * characters: "ID of the character".
* For the favorite feature, when the user clicks at the heart button of a comic, the ID of that comic is saved in the database at an array of favorites. 

# TODO list:
* Add front-end tests using capybara;
* Add logs in all app.
* Add paginaton.
* Add error treatment

# Used Gems
* pry      -> for debugging
* rspec    -> to test backend code
* rubocop  -> code analyzer
* dotenv   -> loads environment variables from a .env file
* httparty -> to consume external api
