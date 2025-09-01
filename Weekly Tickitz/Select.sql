--login
SELECT id, email, role, created_at, updated_at 
FROM users 
WHERE email = 'slamet.gagah@yahoo.co.id' AND password = '0987Slamet?';


--profile
SELECT *
FROM users
LEFT JOIN profile ON users.id = profile.users_id 
WHERE users.id = 1;

--Get all movie (admin)
SELECT id, title, release_date, director_id
FROM movies;

--Delete movie (admin)
DELETE
FROM movies 
WHERE id = 3;

--Edit profile
UPDATE profile 
SET first_name = 'Titus', last_name = 'Bonai', phone_number = '081298537825' 
WHERE users_id = 3;


--Edit Movie
UPDATE movies 
SET 
  backdrop_img = '/fTrQsdMS2MUw00RnzH0r3JWHhts.jpg', 
  sypnosis = 'Levon Cade left behind a decorated military career in the black ops to live a simple life working construction. But when his boss''s daughter, who is like family to him, is taken by human traffickers, his search to bring her home uncovers a world of corruption far greater than he ever could have imagined.',
  poster_img = '/6FRFIogh3zFnVWn7Z6zcYnIbRcX.jpg', 
  release_date = '2025-03-26', 
  duration = 116, 
  title = 'A Working Man', 
  director_id = 3
WHERE id = 5;

-- Up cooming movie
SELECT id, title, release_date, poster_img 
FROM movies 
WHERE release_date > current_date();


-- Get movie with pagination
SELECT id, title, release_date, duration, sypnosis, director_id, poster_img, backdrop_img
FROM movies 
ORDER BY created_at DESC 
LIMIT 10 OFFSET 0;

--Filter movie by name dan genres
SELECT m.id, title, release_date, poster_img
FROM movies m
LEFT JOIN movies_genres mg ON m.id = mg.movies_id
LEFT JOIN genres g ON mg.genres_id = g.id
WHERE title LIKE ('%a') OR g.name = 'Action';

-- Get schedule
SELECT s.id, m.title, c.name as cinema, s.location, t.time, c.ticket_price
FROM schedule s
JOIN movies m ON s.movies_id = m.id
JOIN cinemas c ON s.cinemas_id = c.id
JOIN time t ON s.time_id = t.id;

--Get seat sold
SELECT bs.seat_code 
FROM "Book_seat" bs
JOIN book_tickets bt ON bs.book_id = bt.id
WHERE bt.schedule_id = 2 AND bt.is_paid = true;

--Get movie detail
SELECT m.*, d.name as director 
FROM movies m 
JOIN director d ON m.director_id = d.id 
WHERE m.id = 3;

--Get history
SELECT bt.id, m.title, bt.total_price, bt.is_paid, bt.date
FROM book_tickets bt
JOIN schedule s ON bt.schedule_id = s.id
JOIN movies m ON s.movies_id = m.id
WHERE bt.users_id = ;

--Get movie popular
SELECT m.id, m.title, m.poster_img, COUNT(bt.id) as bookings 
FROM movies m 
LEFT JOIN schedule s ON m.id = s.movies_id 
LEFT JOIN book_tickets bt ON s.id = bt.schedule_id 
GROUP BY m.id ORDER BY bookings DESC;
