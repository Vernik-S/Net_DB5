create table if not exists	Musicians(
	id serial primary key,
	name varchar(20) not null
);

create table if not exists	Genres(
	id serial primary key,
	name varchar(20) not null
);


create table if not exists	GenresMusicians(
	id serial primary key,
	genre_id integer not null references Genres(id),
	musican_id integer not null references Musicians(id)
);

create table if not exists	Albums(
	id serial primary key,
	name varchar(20) not null,
	year smallint not null
);


create table if not exists	AlbumsMusicians(
	id serial primary key,
	album_id integer not null references Albums(id),
	musican_id integer not null references Musicians(id)
);

create table if not exists	Tracks(
	id serial primary key,
	name varchar(20) not null,
	duration int not null
	check (duration > 0),
	album_id integer not null references Albums (id)
);


create table if not exists	Miscellanies(
	id serial primary key,
	name varchar(20) not null,
	year smallint not null
);


create table if not exists	TracksMiscellanies(
	id serial primary key,
	track_id integer not null references Tracks (id),
	miscellany_id integer not null references Miscellanies(id)
);

