SELECT COALESCE(CHR(CAST((SUM(ASCII(letter) - 96) - 1) % 26 + 97 AS INT)), 'z')
AS letter
FROM letters;
