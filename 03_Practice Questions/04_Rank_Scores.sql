-- https://leetcode.com/problems/rank-scores/

SELECT score , 
DENSE_RANK() OVER(ORDER BY Score DESC) AS "Rank"
FROM Scores