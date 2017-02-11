WITH pid_longevity (pid, longevity) AS (
    SELECT p.id,  MAX(m.release_date) - MIN(m.release_date)
    FROM person p, movie m, movie_role mr
    WHERE (
        p.id=mr.person_id AND
        m.id=mr.movie_id
    )
    GROUP BY p.id
)
SELECT p.name
FROM person p, pid_longevity pl
WHERE (
    p.id=pl.pid AND
    pl.longevity=(SELECT MAX(pl2.longevity) FROM pid_longevity pl2)
);
