# FilmDownloader

Used technologies: python, beautifulsoup, selenium, ffmpeg</br>
It is just a part of my project for testing

## Need to do

Download ffmpeg and python with required packages

[ffmpeg](https://ffmpeg.org/download.html) </br>
[python](https://www.python.org/downloads/) </br>
[python packages](https://pypi.org/project/pip/)

You should create your database in mysql and connect to your database using mysql.connector. I am for example using xampp with mysql

```
mysql.connector.connect(user='username', password='password', host='localhost', database='databasename')
```

Then are files to import in Database directory, these data are necessary to start the program

```
filman_categories.sql,
filman_films.sql
```

Last thing is to create 2 additional tables in your database, there will be added information about the progress

```
create table filman_downloaded_films
(
	id int unsigned primary key auto_increment,
	film_id int unsigned,
	is_downloaded bit,
	title varchar(200),
	quality char(30),
	link varchar(400),
	FOREIGN KEY (film_id) references filman_films(id)
);

create table temporary
(
	id int unsigned primary key auto_increment,
	title varchar(200)
)
```

## Short presentation

* How to import files

![alt text](https://media.giphy.com/media/XCcokVIUvlrgBTvdn1/giphy.gif)

![alt text](https://media.giphy.com/media/B4BFiXzy4DlXDB7SI9/giphy.gif)

* Creating rest of the tables

![alt text](https://media.giphy.com/media/ZEjsBycOYV6eDrY0bI/giphy.gif)

* To execute program you have to open cmd where is python file and write python get_films.py

![alt text](https://media.giphy.com/media/ta6OOezHHPRd8eQkVJ/giphy.gif)

* Subprocess stop executing program until end of task that why to execute multi processes I store information about processed films in temporary table and execute next program which use this data to move to next task. If you have fast internet you can even execute 4 programs at once

![alt text](https://media.giphy.com/media/qQOw86uW0j5GqeEQbN/giphy.gif)

* Result of programs. They were canceled after both one of them download film but if you don't stop them they will go through all entities

![alt text](https://media.giphy.com/media/Nk4VUOsyLezkp7jLg8/giphy.gif)

