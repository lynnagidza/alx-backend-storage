-- Create the stored procedure
CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
    DECLARE avg_score DECIMAL(10,2);
    
    -- Calculate the average score
    SELECT AVG(score) INTO avg_score
    FROM scores
    WHERE user_id = user_id;
    
    -- Store the average score
    UPDATE users
    SET average_score = avg_score
    WHERE id = user_id;
END;
