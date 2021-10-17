create table if not exists Styles (
	id serial primary key,
	name varchar(40) not null unique
);


create table if not exists Singers (
	id serial primary key,
	name varchar(70) not null unique,
	alias_name varchar(60) not null
);

create table if not exists Singer_style (
	singer_id integer references Singers(id),
	style_id integer references Styles(id),
	constraint SS primary key (singer_id, style_id)
);

create table if not exists Albums (
	id serial primary key,
	title varchar(70) not null unique,
	year integer check(year > 1900)
);

create table if not exists Singer_album (
	singer_id integer references Singers(id),
	album_id integer references Albums(id),
	constraint SA primary key (singer_id, album_id)
);

create table if not exists Tracks (
	id serial primary key,
	song_name varchar(70) not null,
	duration integer check(duration > 0),
	album_id integer references Albums(id)
);

create table if not exists Collections (
	id serial primary key,
	name varchar(80) not null unique,
	year integer check(year > 1900)
);

create table if not exists Collection_tracks (
	track_id integer references Tracks(id),
	collection_id integer references Collections(id),
	constraint CT primary key (track_id, collection_id)
);