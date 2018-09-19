# Project 4
## Static Web Design

### 1. [Overview](#overview)
### 2. [Instructions](#instructions)
### 3. [Team](#team)
### 4. [Individual Contributions](#individual-contributions)
  * **[Development](#development)**
  * **[Testing](#testing)**
  * **[Meetings](#meetings)**

***

## Overview
The MAGiC team was tasked with redesigning a static web site. The site chosen was Professor Stewart's [website](http://web.cse.ohio-state.edu/~stewart.962/). The app is equipped with Middleman framework (https://middlemanapp.com). The website is not fully dynamic when viewport is under 850px; thus a larger window size is recommended.


## Instructions
### To view the redesigned website:

1. Enter the following command in the terminal to check if you already have Bundler installed:
  ```
   $ bundle -v
  ```

  If bundler were not already present, you would have to install it:

  ```
   $ gem install bundler
   $ rbenv rehash # bookkeeping required by rbenv
  ```
2. Install gems using Bundler:

  ```
   $ bundle install # installs gems and creates Gemfile.lock
   $ rbenv rehash # bookkeeping required by rbenv
  ```

3. Choose one of the following methods to run the application

    - With build folder:

        - Create static files for each file located in your source folder.
        ```
          $ bundle exec middleman build
        ```
        - Open the *build* folder inside the main project folder.

        - Open the *index.html* page in Firefox.

   - With middleman server:
        - start the preview web-server

        ```
          $ bundle exec middleman server
        ```
        - Open  *localhost:4567* in Firefox.



###  To run RSpec test cases:

  ```
   $ bundle exec rake
  ```

***

## Team
| Role|Team Member|
| ------------- |-------------|
| Overall Project Manager|Gail Chen|
|Coding Manager|Ariel Zhu|
|Testing Manager|Mike Lin|
|Documentation Manager|Channing Jacobs|

*Contact Us: osu.magic.team@gmail.com*

***

## Individual Contributions
### Development
Mike:
* scraper.rb
* publication_scraper.rb
* publication.rb
* footer.css.scss
* publication.css.scss
* &#95;footer.erb
* publication.html.erb

Channing:
* layout.erb
* award.rb
* awards_scraper.rb
* awards.css.scss
* navigation.css.scss
* &#95;naviation.erb
* awards.html.erb
* README.md

Gail:
* contact.css.scss
* index.css.scss
* contact.html.erb
* index.html.erb

Ariel:
* lab.css.scss
* site.css.scss
* lab.html.erb
* README.md


### Testing
#### Test plans can be found under lib/testing, lib/system-testing and spec/testing
Mike:
* unit_testing_publication_scraper.rb

Channing:
* unit_testing_awards_scraper.rb

Ariel:
* unit testing index page
* unit testing publication page
* unit testing lab page

Gail:
* unit testing navigation bar partial/css
* unit testing contact page
* unit testing awards page

#### System testing conducted by all members

### Meetings

* July 19th:
  * Stewart's page is chosen to be redesigned
  * HTML layout of each page is decided
  * middleman is setup
* July 20th:
  * CSS is added to each page and overall site styles are chosen
  * Layout file is created
  * Partials for naviation bar and footer are created
  * Scrapers for awards and publication data from original website created
* July 24th:
  * unit testing by all members
  * updates to css and erb files to remove hard coding
  * updates to documentation and README
* July 25th:
  * checks validity of HTML and CSS, resolves errors
  * unit testing for each page
  * finalizes
