CREATE TYPE role  AS ENUM('user', 'admin');

CREATE TABLE "users" (
  "id" int primary key,
  "email" varchar,
  "password" varchar,
  "role" ROLE default 'user',
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "movies" (
  "id" int primary key,
  "title" varchar,
  "release_date" timestamp,
  "duration" int,
  "sypnosis" text,
  "director_id" int,
  "poster_img" text,
  "backdrop_img" text
);

CREATE TABLE "genres" (
  "id" int primary key,
  "name" varchar
);

CREATE TABLE "movies_genres" (
  "movies_id" int references "movies" ("id") ,
  "genres_id" int references "genres" ("id"),
  PRIMARY KEY ("movies_id", "genres_id")
);

CREATE TABLE "cinemas" (
  "id" int primary key,
  "name" varchar,
  "ticket_price" int,
  "logo" varchar
);

CREATE TABLE "book_tickets" (
  "id" int primary key,
  "users_id" int,
  "date" date,
  "total_price" int,
  "schedule_id" int,
  "is_paid" boolean,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "seat" (
  "code" varchar
);

CREATE TABLE "Book_seat" (
  "book_id" int,
  "seat_code" varchar
);

CREATE TABLE "cast" (
  "id" int primary key,
  "name" varchar
);

CREATE TABLE "cast_movies" (
  "movies_id" int references "movies" ("id") ,
  "cast_id" int references "cast" ("id"),
  PRIMARY KEY ("movies_id", "cast_id")
);

CREATE TABLE "director" (
  "id" int primary key,
  "name" varchar
);

CREATE TABLE "profile" (
  "users_id" int primary key,
  "first_name" varchar,
  "last_name" varchar,
  "phone_number" varchar,
  "point_count" int
);

CREATE TABLE "schedule" (
  "id" int primary key,
  "movies_id" int ,
  "cinemas_id" int,
  "location" varchar,
  "time_id" int
);

CREATE TABLE "time" (
  "id" int primary key,
  "time" time
);

ALTER TABLE "movies_genres" ADD FOREIGN KEY ("movies_id") REFERENCES "movies" ("id");

ALTER TABLE "movies" ADD FOREIGN KEY ("director_id") REFERENCES "director" ("id");

ALTER TABLE "book_tickets" ADD FOREIGN KEY ("users_id") REFERENCES "users" ("id");

ALTER TABLE "movies" ADD FOREIGN KEY ("id") REFERENCES "cast_movies" ("movies_id");

ALTER TABLE "cast_movies" ADD FOREIGN KEY ("cast_id") REFERENCES "cast" ("id");

ALTER TABLE "movies_genres" ADD FOREIGN KEY ("genres_id") REFERENCES "genres" ("id");

ALTER TABLE "Book_seat" ADD FOREIGN KEY ("book_id") REFERENCES "book_tickets" ("id");

ALTER TABLE "profile" ADD FOREIGN KEY ("users_id") REFERENCES "users" ("id");

ALTER TABLE "Book_seat" ADD FOREIGN KEY ("seat_code") REFERENCES "seat" ("code");

ALTER TABLE "schedule" ADD FOREIGN KEY ("movies_id") REFERENCES "movies" ("id");

ALTER TABLE "schedule" ADD FOREIGN KEY ("cinemas_id") REFERENCES "cinemas" ("id");

ALTER TABLE "book_tickets" ADD FOREIGN KEY ("schedule_id") REFERENCES "schedule" ("id");

ALTER TABLE "schedule" ADD FOREIGN KEY ("time_id") REFERENCES "time" ("id");


ALTER TABLE "users" 
ALTER COLUMN "id"
  ADD GENERATED ALWAYS AS IDENTITY;

ALTER TABLE "users"
  ALTER COLUMN "created_at"
  SET DEFAULT NOW();
