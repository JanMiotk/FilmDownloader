# FilmDownloader

Used technologies: python, beautifulsoup, selenium, ffmpeg</br>
It is just a part of my project for testing

## Need to do

Download ffmpeg and python

[ffmpeg](https://ffmpeg.org/download.html)
[python](https://www.python.org/downloads/)

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
)

create table temporary
(
	id int unsigned primary key auto_increment,
	title varchar(200)
)
```



