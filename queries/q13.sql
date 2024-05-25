CREATE VIEW chef_professional_grades AS
SELECT 
    id, 
    CASE professionalGrade
        WHEN 'Third-Chef' THEN 1
        WHEN 'Second-Chef' THEN 2
        WHEN 'First-Chef' THEN 3
        WHEN 'Sous-Chef' THEN 4
        WHEN 'Head-Chef' THEN 5
    END AS grade
FROM 
    chefs;


CREATE VIEW episode_professional_grades AS
SELECT 
    ej.episodeYear,
    ej.episodeNumber,
    AVG(cpg.grade) AS avg_judge_grade
FROM 
    episode_judges ej
JOIN 
    chef_professional_grades cpg ON ej.chefId = cpg.id
GROUP BY 
    ej.episodeYear, ej.episodeNumber;

CREATE VIEW episode_chef_professional_grades AS
SELECT 
    er.episodeYear,
    er.episodeNumber,
    AVG(cpg.grade) AS avg_chef_grade
FROM 
    episode_recipes er
JOIN 
    chef_professional_grades cpg ON er.chefAssignedToRecipeId = cpg.id
GROUP BY 
    er.episodeYear, er.episodeNumber;


CREATE VIEW combined_episode_professional_grades AS
SELECT 
    epg.episodeYear,
    epg.episodeNumber,
    (epg.avg_judge_grade + ecpg.avg_chef_grade) / 2 AS combined_avg_grade
FROM 
    episode_professional_grades epg
JOIN 
    episode_chef_professional_grades ecpg ON epg.episodeYear = ecpg.episodeYear AND epg.episodeNumber = ecpg.episodeNumber;

CREATE VIEW lowest_combined_professional_grade_episode AS
SELECT 
    episodeYear,
    episodeNumber,
    combined_avg_grade
FROM 
    combined_episode_professional_grades
ORDER BY 
    combined_avg_grade ASC
LIMIT 1;


SELECT 
    episodeYear, 
    episodeNumber, 
    combined_avg_grade
FROM 
    lowest_combined_professional_grade_episode;

DROP VIEW chef_professional_grades;
DROP VIEW episode_professional_grades;
DROP VIEW episode_chef_professional_grades;
DROP VIEW combined_episode_professional_grades;
DROP VIEW lowest_combined_professional_grade_episode;