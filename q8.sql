CREATE VIEW high_ratings (name) AS
    SELECT DISTINCT(p.name)
    FROM person p, movie_role mr, movie m, imdb_user_review iur
    WHERE (
        iur.rating >= 8 AND
        m.id = iur.movie_id AND
        mr.movie_id = m.id AND
        p.id = mr.person_id
    )
;

CREATE VIEW low_ratings (name) AS
    SELECT DISTINCT(p.name)
    FROM person p, movie_role mr, movie m, imdb_user_review iur
    WHERE (
        iur.rating < 8 AND
        m.id = iur.movie_id AND
        mr.movie_id = m.id AND
        p.id = mr.person_id
    )
;

SELECT COUNT(hr.name) AS high_ratings_count FROM high_ratings hr;
SELECT COUNT(lr.name) AS low_ratings_count FROM low_ratings lr;

SELECT COUNT(hr.name) AS no_flop_count
FROM high_ratings hr
WHERE hr.name NOT IN (SELECT lr.name FROM low_ratings lr);

SELECT * FROM (
    SELECT p.name, COUNT(mr.movie_id)
    FROM high_ratings hr, person p, movie_role mr
    WHERE (
        hr.name NOT IN (SELECT lr.name FROM low_ratings lr) AND
        p.name = hr.name AND
        mr.person_id = p.id
    )
    GROUP BY mr.person_id, p.name
    ORDER BY COUNT(mr.movie_id) DESC, p.name ASC
) WHERE ROWNUM <= 10;
