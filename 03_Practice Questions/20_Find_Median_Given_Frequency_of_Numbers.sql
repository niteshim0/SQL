WITH cte AS (
  SELECT num,
         freq,
         SUM(freq) OVER (ORDER BY num) AS cum_freq,
         SUM(freq) OVER () AS total_freq
  FROM Numbers
)
SELECT AVG(num*1.0) AS median
FROM cte
WHERE cum_freq >= total_freq/2
  AND cum_freq - freq < (total_freq+1)/2;
