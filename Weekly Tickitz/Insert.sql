--Register
INSERT INTO users (email, password) VALUES 
('anggiprayoga@gmail.com', '1234Anggi!', NOW()),
('slamet.gagah@yahoo.co.id', '0987Slamet?', NOW()),
('opet.fede@gmail.com', '1105Opet!');

INSERT INTO profile (users_id, first_name, last_name, phone_number, point_count) VALUES
(1, 'Anggi', 'Prayoga', '081212908725', 0),
(2, 'Slamet', 'Syahputra', '081923546173', 0),
(3, 'Federus', 'Rudi', '085677209811', 0);

INSERT INTO director (id, name) VALUES
(1, 'Christopher Nolan'),
(2, 'Steven Spielberg'),
(3, 'Quentin Tarantino'),
(4, 'Martin Scorsese'),
(5, 'Denis Villeneuve');

INSERT INTO genres (id, name) VALUES
(1, 'Action'),
(2, 'Drama'),
(3, 'Comedy'),
(4, 'Horror'),
(5, 'Sci-Fi'),
(6, 'Romance'),
(7, 'Thriller');

INSERT INTO "cast" (id, name) VALUES
(1, 'Leonardo DiCaprio'),
(2, 'Scarlett Johansson'),
(3, 'Robert Downey Jr.'),
(4, 'Emma Stone'),
(5, 'Ryan Gosling'),
(6, 'Margot Robbie'),
(7, 'Tom Hanks'),
(8, 'Meryl Streep');

INSERT INTO movies (id, title, release_date, duration, sypnosis, director_id, poster_img, backdrop_img) VALUES
(1, 'Inception', '2024-07-16', 148, 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.', 1, 'inception_poster.jpg', 'inception_backdrop.jpg'),
(2, 'The Departed', '2024-08-20', 151, 'An undercover cop and a police informant play a cat and mouse game with each other as they attempt to gather information on their respective organizations.', 4, 'departed_poster.jpg', 'departed_backdrop.jpg'),
(3, 'La La Land', '2024-09-15', 128, 'A jazz musician and an aspiring actress fall in love while pursuing their dreams in Los Angeles.', 2, 'lalaland_poster.jpg', 'lalaland_backdrop.jpg'),
(4, 'Dune: Part Two', '2024-10-01', 166, 'Paul Atreides unites with Chani and the Fremen while seeking revenge against the conspirators who destroyed his family.', 5, 'dune2_poster.jpg', 'dune2_backdrop.jpg'),
(5, 'Barbie', '2024-11-10', 114, 'Barbie and Ken are having the time of their lives in the colorful and seemingly perfect world of Barbie Land.', 3, 'barbie_poster.jpg', 'barbie_backdrop.jpg');


INSERT INTO movies_genres (movies_id, genres_id) VALUES
(1, 1), (1, 5), (1, 7),  
(2, 1), (2, 2), (2, 7),  
(3, 2), (3, 6),          
(4, 1), (4, 5), (4, 2);

INSERT INTO cast_movies (movies_id, cast_id) VALUES
(1, 1), (1, 2),  
(2, 1), (2, 3),  
(3, 4), (3, 5),  
(4, 2), (4, 3),  
(5, 6), (5, 4);

INSERT INTO cinemas (id, name, ticket_price, logo) VALUES
(1, 'Hiflix', 45000, 'hiflix_logo.png'),
(2, 'CineOne21', 40000, 'cineone21_logo.png'),
(3, 'Cinépolis', 50000, 'cinepolis_logo.png'),
(4, 'EBV', 75000, 'EBV_logo.png'),
(5, 'Cineplex', 60000, 'cineplex_logo.png');


INSERT INTO time (id, time) VALUES
(1, '10:00'),
(2, '13:00'),
(3, '16:00'),
(4, '19:00'),
(5, '22:00');


INSERT INTO schedule (id, movies_id, cinemas_id, location, time_id) VALUES
(1, 1, 1, 'Cibubur', 1),
(2, 1, 1, 'Cibubur', 3),
(3, 2, 2, 'Aceh', 2),
(4, 3, 3, 'Pinang', 4),
(5, 4, 4, 'Jakarta Pusat', 5),
(6, 5, 5, 'Depok', 1),
(7, 1, 2, 'Bogor', 2),
(8, 2, 3, 'Tangerang', 3),
(9, 3, 4, 'Bekasi', 4),
(10, 4, 1, 'Batam', 5);

INSERT INTO seat (code) VALUES
('A1'), ('A2'), ('A3'), ('A4'), ('A5'),
('B1'), ('B2'), ('B3'), ('B4'), ('B5'),
('C1'), ('C2'), ('C3'), ('C4'), ('C5'),
('D1'), ('D2'), ('D3'), ('D4'), ('D5'),
('E1'), ('E2'), ('E3'), ('E4'), ('E5');

--Create order
INSERT INTO book_tickets (id, users_id, date, total_price, schedule_id, is_paid, created_at, updated_at) VALUES
(1, 2, '2025-07-20', 90000, 1, true, '2025-07-18 10:30', '2025-07-18 10:30'),
(2, 3, '2025-07-21', 45000, 2, true, '2025-07-19 14:45', '2025-07-19 14:45'),
(3, 4, '2025-08-25', 80000, 3, false, '2025-08-23 09:20', '2025-08-23 09:20'),
(4, 5, '2025-09-20', 100000, 4, true, '2025-09-18 16:10', '2025-09-18 16:10'),
(5, 2, '2025-10-05', 150000, 5, true, '2025-10-03 11:25', '2025-10-03 11:25');

INSERT INTO "Book_seat" (book_id, seat_code) VALUES
(1, 'A1'), (1, 'A2'),  
(2, 'B3'),           
(3, 'C1'), (3, 'C2'),  
(4, 'D4'), (4, 'D5'),  
(5, 'E1'), (5, 'E2');