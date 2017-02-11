WITH mid_cast_size (mid, cast_size) AS (
    SELECT mr.movie_id, COUNT(DISTINCT(mr.person_id))
    FROM movie_role mr
    GROUP BY mr.movie_id
)
SELECT m.title, mcs.cast_size
FROM movie m, mid_cast_size mcs
WHERE m.id=mcs.mid AND mcs.cast_size = (
    SELECT MAX(mcs2.cast_size)
    FROM mid_cast_size mcs2
);
