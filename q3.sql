SELECT m.*
FROM movie m
WHERE m.id IN
(
    (
        SELECT iur.movie_id
        FROM imdb_user_review iur
        WHERE iur.votes = (
            SELECT MAX(votes) FROM imdb_user_review
        )
    )
    UNION
    (
        SELECT iur.movie_id
        FROM imdb_user_review iur
        GROUP BY iur.movie_id
        HAVING AVG(iur.rating) = (
            SELECT MIN(AVG(iur2.rating))
            FROM imdb_user_review iur2
            GROUP BY iur2.movie_id
        )
    )
);
