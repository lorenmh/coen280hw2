WITH decades (start_date, end_date) AS (
  SELECT movie.release_date, TO_DATE(EXTRACT(YEAR FROM movie.release_date)+10, 'YYYY')
  FROM movie
)
SELECT d.start_date
FROM movie m, decades d
WHERE m.release_date BETWEEN d.start_date AND d.end_date
GROUP BY d.start_date
HAVING COUNT(m.id) = (
  SELECT MAX(COUNT(m2.id))
  FROM movie m2, decades d2
  WHERE m2.release_date BETWEEN d2.start_date AND d2.end_date
  GROUP BY d2.start_date
);
