import sqlite3
import random

conn = sqlite3.connect('example.db')
cur = conn.cursor()

# cur.execute('DELETE FROM episodes')
# cur.execute('DELETE FROM episode_judges')
# cur.execute('DELETE FROM episode_recipes')
# cur.execute('DELETE FROM recipe_score')

cur.execute("SELECT MAX(episodeYear) FROM episodes")
result = cur.fetchone()

if result[0] is None:
    season_year = 2024
else:
    season_year = result[0] + 1


cur.execute("INSERT INTO episodes (episodeYear, episodeNumber) VALUES (?,1)",(season_year,))
cur.execute("INSERT INTO episodes (episodeYear, episodeNumber) VALUES (?,2)",(season_year,))
cur.execute("INSERT INTO episodes (episodeYear, episodeNumber) VALUES (?,3)",(season_year,))
cur.execute("INSERT INTO episodes (episodeYear, episodeNumber) VALUES (?,4)",(season_year,))
cur.execute("INSERT INTO episodes (episodeYear, episodeNumber) VALUES (?,5)",(season_year,))
cur.execute("INSERT INTO episodes (episodeYear, episodeNumber) VALUES (?,6)",(season_year,))
cur.execute("INSERT INTO episodes (episodeYear, episodeNumber) VALUES (?,7)",(season_year,))
cur.execute("INSERT INTO episodes (episodeYear, episodeNumber) VALUES (?,8)",(season_year,))
cur.execute("INSERT INTO episodes (episodeYear, episodeNumber) VALUES (?,9)",(season_year,))
cur.execute("INSERT INTO episodes (episodeYear, episodeNumber) VALUES (?,10)",(season_year,))

conn.commit()

cur.execute("SELECT episodeYear,episodeNumber FROM episodes WHERE episodeYear = ?",(season_year,))        
episodes = cur.fetchall()       #   choose a national cuisine

for (episodeYear,episodeNumber) in episodes:
    cur.execute("SELECT id FROM chefs")          
    pottential_judges = [x[0] for x in cur.fetchall()]                                                 
    judges = random.sample(pottential_judges, 3)  
    i = 1
    for judge in judges:
        cur.execute("INSERT INTO episode_judges (episodeYear, episodeNumber,chefId,judgeNumber) VALUES (?,?,?,?)",(episodeYear,episodeNumber,judge,i))
        i = i + 1


for (episodeYear,episodeNumber) in episodes:
    i = 1
    while i != 11:
        cur.execute("SELECT name FROM nationalCuisines")        #
        nationalCuisines = [x[0] for x in cur.fetchall()]       #   choose a national cuisine
        nationalCuisine = random.choice(nationalCuisines)       #

        cur.execute("SELECT name FROM recipes WHERE nationalCuisine = ?",(nationalCuisine,))    #
        recipes = [x[0] for x in cur.fetchall()]                                                #   choose a recipe for this national cuisine
        recipe = random.choice(recipes)                                                         #


        cur.execute("SELECT chefId FROM chefs_recipes WHERE recipeName = ?",(recipe,))          #
        chefs = [x[0] for x in cur.fetchall()]                                                  #   choose a chef for this recipe
        chef = random.choice(chefs)                                                             #


        try:
            cur.execute("INSERT INTO episode_recipes (episodeYear, episodeNumber,recipeNumber,recipeName,recipeNationalCuisine,chefAssignedToRecipeId) VALUES (?,?,?,?,?,?)",(episodeYear,episodeNumber,i,recipe, nationalCuisine,chef))       
        except sqlite3.IntegrityError as e:
            print(e)
            conn.rollback()
            continue

        conn.commit()
        i = i + 1


for (episodeYear,episodeNumber) in episodes:
    for recipeNumber in range(1,11):
        for judgeNumber in range(1,4):
            cur.execute("SELECT chefId  FROM episode_judges WHERE episodeYear = ? AND episodeNumber = ? AND judgeNumber = ?",(episodeYear,episodeNumber,judgeNumber))
            chefId = cur.fetchone()
            score =  random.randint(1, 5)
            cur.execute("INSERT INTO recipe_score (episodeYear,episodeNumber,recipeNumber,judgeNumber,score,judgeId) VALUES (?,?,?,?,?,?)",(episodeYear,episodeNumber,recipeNumber,judgeNumber,score,chefId[0]))



cur.close()
conn.commit()
conn.close()