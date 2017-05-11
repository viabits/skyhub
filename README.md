Sky Hub
================

* Main goal: resize photos.

Features
--------------
* It consumes a webservice endpoint (http://54.152.221.29/images.json) that
  returns a JSON of photos.
* There are 10 photos.
* It generates three different formats for each photo.
  The dimensions are:
    - small (320x240)
    - medium (384x288)
    - large (640x480)
* It has a webservice endpoint that lists in JSON format.
  - It lists all the ten photos with their respective formats, providing their URLs.

How to use
--------------
* To consume the webservice described above go to http://skyhubapp.heroku.com/images/feed
* To see the results go to http://skyhubapp.heroku.com/images/list

Ruby On Rails
-------------

This application requires:

- Ruby 2.4.0
- Ruby On Rails 5.1.0

Data storage
------------
* Mongodb for data
* AWS S3 for photos

Instruction to run
--------------

* In development mode
  - rails server

* In production mode
  - See previous session 'How to use'

Instruction to run all tests
----------------------------

- rspec -fd

Why Ruby?
---------
* For this solution I chose Ruby due to its clear, elegant & very effective syntax.
  Ruby is one of the most wanted modern languages to learn nowadays.
  In this case, of course I could have chosen other languages like Python or .Net,
  but Ruby is the language i like the most for the time being :-D .


