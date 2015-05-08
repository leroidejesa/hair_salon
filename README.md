HAIR SALON<br>
by leroi dejesa<br>
copyright 2015, all rights reserved<br>
license: MIT<br>
<br>
HEROKU:<br>
<br>
DESCRIPTION: it's a hair salon management system that lets you view, edit, and/or delete stylists and their respective clients.<br><br>
DATABASE INSTRUCTIONS<br>
username=# CREATE DATABASE hair_salon;<br>
username=# \c hair_salon;<br>
hair_salon=# CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);<br>
hair_salon=# CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);<br>
hair_salon=# CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;<br><br>

INSTALLATION:<br>
1. clone<br>
2. bundle<br>
3. run local server<br>
4. enjoy!
