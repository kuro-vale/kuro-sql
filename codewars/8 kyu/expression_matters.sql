-- https://www.codewars.com/kata/5ae62fcf252e66d44d00008e/sql

SELECT GREATEST(a * b * c, a + b + c, (a + b) * c, a * (b + c)) as res
FROM expression_matter;
