-- Create a temporary table to store the rankings
CREATE TEMPORARY TABLE IF NOT EXISTS temp_rankings (
    band_name VARCHAR(255),
    lifespan INT
);

-- Insert data into the temporary table
INSERT INTO temp_rankings (band_name, lifespan)
SELECT band_name, (2022 - SPLIT(formed, '-') + 1) AS lifespan
FROM metal_bands
WHERE FIND_IN_SET('Glam rock', style) > 0
ORDER BY lifespan DESC;

-- Select the rankings from the temporary table
SELECT band_name, lifespan
FROM temp_rankings;
