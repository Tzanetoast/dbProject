SELECT c.firstName, c.lastName
FROM chefs AS c
LEFT JOIN episode_judges AS ej ON c.id = ej.chefId
WHERE ej.chefId IS NULL