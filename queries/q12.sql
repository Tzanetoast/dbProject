DROP VIEW IF EXISTS episode_difficulty;
DROP VIEW IF EXISTS most_difficult_episode_per_year;

CREATE VIEW episode_difficulty AS
SELECT 
    er.episodeYear, 
    er.episodeNumber, 
    AVG(r.difficulty) AS avg_difficulty
FROM 
    episode_recipes er
JOIN 
    recipes r ON er.recipeName = r.name
GROUP BY 
    er.episodeYear, er.episodeNumber;


CREATE VIEW most_difficult_episode_per_year AS
SELECT 
    ed.episodeYear, 
    ed.episodeNumber, 
    ed.avg_difficulty
FROM 
    episode_difficulty ed
JOIN (
    SELECT 
        episodeYear, 
        MAX(avg_difficulty) AS max_difficulty
    FROM 
        episode_difficulty
    GROUP BY 
        episodeYear
) max_difficulty_per_year ON ed.episodeYear = max_difficulty_per_year.episodeYear AND ed.avg_difficulty = max_difficulty_per_year.max_difficulty;


SELECT 
    episodeYear, 
    episodeNumber, 
    avg_difficulty
FROM 
    most_difficult_episode_per_year;

DROP VIEW IF EXISTS episode_difficulty;
DROP VIEW IF EXISTS most_difficult_episode_per_year;