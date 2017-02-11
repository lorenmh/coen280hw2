SELECT m.id, m.title, m.release_date, iur.votes, iur.rating
FROM movie m, imdb_user_review iur
WHERE iur.rating=(SELECT MAX(rating) FROM imdb_user_review) AND iur.movie_id=m.id
ORDER BY m.id ASC;
