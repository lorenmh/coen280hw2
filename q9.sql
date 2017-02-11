SELECT DISTINCT(p.name)
FROM person p, movie_role mr
WHERE (
    mr.movie_id IN (
        SELECT mr2.movie_id
        FROM person p, movie_role mr2
        WHERE (
            p.name = 'Al Pacino' AND
            mr2.person_id = p.id
        )
    ) AND
    p.id = mr.person_id AND
    p.name != 'Al Pacino'
);
