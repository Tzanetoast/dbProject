CREATE VIEW view_1 AS
SELECT chefId, episodeYear, COUNT(*) AS appearances
FROM episode_judges
GROUP BY chefId, episodeYear
HAVING appearances > 3;


CREATE VIEW view_2 AS
SELECT t1.chefId AS chefId1, t2.chefId AS chefId2, t1.appearances, t1.episodeYear
FROM view_1 t1
JOIN view_1 t2 ON t1.appearances = t2.appearances AND t1.episodeYear = t2.episodeYear
WHERE t1.chefId < t2.chefId;



CREATE VIEW view_3 AS
SELECT 
    c1.firstName AS chef1_firstName, 
    c1.lastName AS chef1_lastName, 
    view_2.chefId2, 
    view_2.appearances, 
    view_2.episodeYear
FROM view_2
JOIN chefs c1 ON view_2.chefId1 = c1.id;

CREATE VIEW view_4 AS
SELECT 
    view_3.chef1_firstName, 
    view_3.chef1_lastName, 
    c2.firstName AS chef2_firstName, 
    c2.lastName AS chef2_lastName, 
    view_3.appearances, 
    view_3.episodeYear
FROM view_3
JOIN chefs c2 ON view_3.chefId2 = c2.id;


