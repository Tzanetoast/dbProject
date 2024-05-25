DROP VIEW IF EXISTS judge_chef_scores;
DROP VIEW IF EXISTS top_5_judges_with_names;
DROP VIEW IF EXISTS top_5_judges;


CREATE VIEW judge_chef_scores AS
SELECT 
    rs.judgeId,
    er.chefAssignedToRecipeId AS chefId,
    SUM(rs.score) AS total_score
FROM 
    recipe_score rs
JOIN 
    episode_recipes er ON rs.episodeYear = er.episodeYear AND rs.episodeNumber = er.episodeNumber AND rs.recipeNumber = er.recipeNumber
GROUP BY 
    rs.judgeId, er.chefAssignedToRecipeId;

CREATE VIEW top_5_judges AS
SELECT 
    jcs.judgeId,
    jcs.chefId,
    jcs.total_score
FROM 
    judge_chef_scores jcs
ORDER BY 
    jcs.total_score DESC
LIMIT 5;


CREATE VIEW top_5_judges_with_names AS
SELECT 
    c1.firstName AS judge_first_name, 
    c1.lastName AS judge_last_name, 
    c2.firstName AS chef_first_name, 
    c2.lastName AS chef_last_name, 
    t5j.total_score
FROM 
    top_5_judges t5j
JOIN 
    chefs c1 ON t5j.judgeId = c1.id
JOIN 
    chefs c2 ON t5j.chefId = c2.id;


SELECT 
    *
FROM 
    top_5_judges_with_names;



DROP VIEW IF EXISTS judge_chef_scores;
DROP VIEW IF EXISTS top_5_judges_with_names;
DROP VIEW IF EXISTS top_5_judges;


-- ETOIMO