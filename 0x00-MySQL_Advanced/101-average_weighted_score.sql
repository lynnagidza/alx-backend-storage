-- Create the stored procedure
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    DECLARE user_id INT;
    DECLARE total_score DECIMAL(10, 2);
    DECLARE total_weight DECIMAL(10, 2);
    DECLARE avg_weighted_score DECIMAL(10, 2);
    
    -- Declare a cursor to iterate through the users
    DECLARE user_cursor CURSOR FOR
    SELECT id FROM users;
    
    -- Open the cursor
    OPEN user_cursor;
    
    -- Start iterating through the users
    read_loop: LOOP
        -- Fetch the next user_id from the cursor
        FETCH user_cursor INTO user_id;
        
        -- Check if there are no more users
        IF user_id IS NULL THEN
            LEAVE read_loop;
        END IF;
        
        -- Calculate the total score and total weight for the current user
        SELECT SUM(score * weight) INTO total_score, SUM(weight) INTO total_weight
        FROM scores
        WHERE user_id = user_id;
        
        -- Calculate the average weighted score
        IF total_weight > 0 THEN
            SET avg_weighted_score = total_score / total_weight;
        ELSE
            SET avg_weighted_score = 0;
        END IF;
        
        -- Store the average weighted score for the current user
        UPDATE users
        SET average_weighted_score = avg_weighted_score
        WHERE id = user_id;
    END LOOP;
    
    -- Close the cursor
    CLOSE user_cursor;
    
END;
