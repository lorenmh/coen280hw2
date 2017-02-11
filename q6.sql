WITH mid_pid_role_count (mid, pid, role_count) AS (
    SELECT mr.movie_id, mr.person_id, COUNT(mr.person_id)
    FROM person p, movie_role mr
    WHERE p.id = mr.person_id
    GROUP BY mr.movie_id, mr.person_id
)
SELECT p.name, m.title, mpr.role_count
FROM person p, movie m, mid_pid_role_count mpr
WHERE (
    p.id=mpr.pid AND
    m.id=mpr.mid AND
    EXTRACT(YEAR FROM m.release_date)=2010 AND
    mpr.role_count >= 5
);
