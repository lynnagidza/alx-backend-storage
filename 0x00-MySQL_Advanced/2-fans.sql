-- Create a temporary table to store the ranks
CREATE TEMPORARY TABLE IF NOT EXISTS temp_ranks (
    origin VARCHAR(255),
    nb_fans INT
);

-- Insert data into the temporary table
INSERT INTO temp_ranks (origin, nb_fans)
SELECT origin, COUNT(fan_id) AS nb_fans
FROM metal_bands
GROUP BY origin
ORDER BY nb_fans DESC;

-- Select the ranks from the temporary table
SELECT origin, nb_fans
FROM temp_ranks;
