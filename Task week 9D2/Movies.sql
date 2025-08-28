CREATE TABLE "Movies" (
  "id" int,
  "title" varchar,
  "release_date" timestamp,
  "rating" int
);

CREATE TABLE "Actors" (
  "id" int,
  "name" varchar
);

CREATE TABLE "Movies_Actors" (
  "movie_id" int,
  "actor_id" int,
  "role" varchar
);

ALTER TABLE "Movies_Actors" ADD FOREIGN KEY ("movie_id") REFERENCES "Movies" ("id");

ALTER TABLE "Actors" ADD FOREIGN KEY ("id") REFERENCES "Movies_Actors" ("actor_id");


SELECT id, title, rating, release_date FROM "Movies" 
WHERE release_date BETWEEN '2020-01-01 00:00' AND '2020-12-31 23:59';

SELECT id, name FROM "Actors"
WHERE name like '%s';

SELECT id, title, rating, release_date FROM "Movies"
WHERE rating BETWEEN 4 AND 7
AND release_date BETWEEN '2004-01-01 00:00' AND '2010-12-31 23:59';