-- Create the stored procedure
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN user_id INT)
BEGIN
    DECLARE total_score DECIMAL(10, 2);
    DECLARE total_weight DECIMAL(10, 2);
    DECLARE avg_weighted_score DECIMAL(10, 2);
    
    -- Calculate the total score and total weight
    SELECT SUM(score * weight) INTO total_score, SUM(weight) INTO total_weight
    FROM scores
    WHERE user_id = user_id;
    
    -- Calculate the average weighted score
    IF total_weight > 0 THEN
        SET avg_weighted_score = total_score / total_weight;
    ELSE
        SET avg_weighted_score = 0;
    END IF;
    
    -- Store the average weighted score
    UPDATE users
    SET average_weighted_score = avg_weighted_score
    WHERE id = user_id;
END;
