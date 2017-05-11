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


Ruby
-------------

This application requires:

- Ruby 2.4.0

Instruction to run
--------------

- ruby skyhub.rb

Instruction to run all tests
----------------------------

- rspec -fd

Why Ruby?
---------
* For this solution I chose Ruby due to its clear, elegant & very effective syntax.
  Ruby is one of the most wanted modern languages to learn nowadays.
  In this case, of course I could have chosen other languages like Python or .Net,
  but Ruby is the language i like the most for the time being :-D .


