CREATE TABLE "Books" (
  "id" serial PRIMARY KEY,
  "name" varchar(100) NOT NULL,
  "author" varchar(100) NOT NULL,
  "bookshelve_id" int
);

CREATE TABLE "Categories" (
  "id" serial PRIMARY KEY,
  "name" varchar(100) NOT NULL
);

CREATE TABLE "Bookshelves" (
  "id" serial PRIMARY KEY,
  "code" varchar(50) NOT NULL,
  "category_id" int
);

CREATE TABLE "Members" (
  "id" serial PRIMARY KEY,
  "name" varchar(100) NOT NULL
);

CREATE TABLE "Librarians" (
  "id" serial PRIMARY KEY,
  "name" varchar(100) NOT NULL
);

CREATE TABLE "Borrowing" (
  "id" serial PRIMARY KEY,
  "book_id" int,
  "member_id" int,
  "librarian_id" int,
  "created_at" timestamp
);

ALTER TABLE "Books" ADD FOREIGN KEY ("bookshelve_id") REFERENCES "Bookshelves" ("id");

ALTER TABLE "Bookshelves" ADD FOREIGN KEY ("category_id") REFERENCES "Categories" ("id");

CREATE TABLE "Books_Members" (
  "Books_id" serial,
  "Members_id" serial,
  PRIMARY KEY ("Books_id", "Members_id")
);

ALTER TABLE "Books_Members" ADD FOREIGN KEY ("Books_id") REFERENCES "Books" ("id");

ALTER TABLE "Books_Members" ADD FOREIGN KEY ("Members_id") REFERENCES "Members" ("id");


CREATE TABLE "Members_Librarians" (
  "Members_id" serial,
  "Librarians_id" serial,
  PRIMARY KEY ("Members_id", "Librarians_id")
);

ALTER TABLE "Members_Librarians" ADD FOREIGN KEY ("Members_id") REFERENCES "Members" ("id");

ALTER TABLE "Members_Librarians" ADD FOREIGN KEY ("Librarians_id") REFERENCES "Librarians" ("id");


ALTER TABLE "Borrowing" ADD FOREIGN KEY ("book_id") REFERENCES "Books" ("id");

ALTER TABLE "Borrowing" ADD FOREIGN KEY ("member_id") REFERENCES "Members" ("id");

ALTER TABLE "Borrowing" ADD FOREIGN KEY ("librarian_id") REFERENCES "Librarians" ("id");


INSERT INTO "Bookshelves" (code, category_id)
VALUES
('cmd', 001),
('fts', 002),
('rmc', 004),
('tfsr', 005),
('mjh', 006),
('bgf', 007),
('nvl', 008),
('hrr', 009),
('hst', 011),
('fml', 010)
;


INSERT INTO "Categories" (name)
VALUES
('Comedy'),
('Fantasy'),
('Romance'),
('Tafsir'),
('Majalah'),
('Biografi'),
('Novel'),
('Horor'),
('Family'),
('History')
;

INSERT INTO "Members" (name)
VALUES
('Slamet'),
('Sidik'),
('Junita'),
('Opet'),
('Ucup'),
('Anggi'),
('Nisa'),
('Bobi'),
('Eyon'),
('Bonai')
;

INSERT INTO "Librarians" (name)
VALUES
('Joko'),
('Bowo'),
('Mega'),
('Yono'),
('Asep'),
('Mamad'),
('Ujang'),
('Jarwo'),
('Tono'),
('Supri')
;



INSERT INTO "Books" (name, author, bookshelve_id)
VALUES
('Manusia Setengah Salmon', 'Raditya Dika', 001),
('Gitu Aja Kok Repot', 'Abdur Rahman', 001),
('Harry Potter', 'J.K Rowling', 002),
('Neverwhere', 'Neil Gaiman', 002),
('Dilan', 'Piqi Baiq', 003),
('Ayat Ayat Cinta', 'Habiburrahman El Shirazy',003),
('AI dan Masa Depan Pendidikan: Siapkah Kita?', 'Raka Pratama', 005),
('Langkah Dalam Hujan', 'Reza Wirawan', 007),
('Boneka Di Loteng', 'Livia Anindya', 008),
('Ibu Selalu Tahu', 'Niken Larasati', 010)
;




INSERT INTO "Borrowing" (book_id, member_id, librarian_id, create_at)
VALUES
(025, 006, 010, NOW()),
(011, 003, 007, NOW()),
(033, 001, 002, NOW()),
(024, 010, 005, NOW()),
(008, 004, 004, NOW()),
(017, 007, 003, NOW()),
(001, 002, 001, NOW()),
(045, 008, 006, NOW()),
(037, 005, 008, NOW()),
(041, 009, 009, NOW())
;








SELECT "id", "name", "author", "bookshelve_id" from "Books";

SELECT "id", "name" from "Categories";

SELECT "id", "code", "category_id" FROM "Bookshelves";

SELECT "id", "name" FROM "Members";

SELECT "id", "name" FROM "Librarians";

SELECT "id", "book_id", "member_id", "librarian_id", "created_at" FROM "Borrowing";
