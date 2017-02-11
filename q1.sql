SELECT p.name
FROM movie m, movie_role mr, person p
WHERE m.title='The Da Vinci Code' AND m.id=mr.movie_id AND p.id=mr.person_id
ORDER BY p.name ASC;
