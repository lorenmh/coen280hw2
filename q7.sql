WITH year_max_rating (year, max_rating) AS (
    SELECT EXTRACT(YEAR FROM m.release_date), MAX(iur.rating)
    FROM movie m, imdb_user_review iur
    WHERE m.id=iur.movie_id
    GROUP BY EXTRACT(YEAR FROM m.release_date)
)
SELECT ymr.year, m.title, iur.rating
FROM year_max_rating ymr, movie m, imdb_user_review iur
WHERE (
    iur.rating=ymr.max_rating AND
    iur.movie_id=m.id AND
    EXTRACT(YEAR FROM m.release_date) = ymr.year AND
    EXTRACT(YEAR FROM m.release_date) >= 2005
)
ORDER BY ymr.year, m.title;
