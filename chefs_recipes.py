import sqlite3
import random

def connect_db():
    return sqlite3.connect('example.db')

def assign_cuisines():
    conn = connect_db()
    cur = conn.cursor()
    
    # Fetch all chef IDs and names
    cur.execute("SELECT *  FROM chefs_nationalCuisines")
    chefs_cuisines = cur.fetchall()
    
    # Fetch all cuisine names
    cur.execute("SELECT name, nationalCuisine FROM recipes")
    recipes = cur.fetchall()

    for chef_cuisine in chefs_cuisines:
        recipes_subset = [recipe for recipe in recipes if recipe[1] == chef_cuisine[1]]     
        for recipe in recipes_subset:
            if(random.randint(1, 3)>2):
                cur.execute("INSERT INTO chefs_recipes (chefId, recipeName) VALUES (?, ?)",(chef_cuisine[0], recipe[0]))               


    cur.execute("SELECT recipeName FROM chefs_recipes")
    recipes_x =  [x[0] for x in cur.fetchall()]

    cur.execute("SELECT name FROM recipes")
    recipes_y =  [x[0] for x in cur.fetchall()]
    recipes_that_dont_have_chef = [recipe for recipe in recipes_y if recipe not in recipes_x]

    if len(recipes_that_dont_have_chef) > 0:
        for recipe_that_doesnt_have_chef in recipes_that_dont_have_chef:
            cur.execute("SELECT nationalCuisine FROM recipes WHERE name = ?", (recipe_that_doesnt_have_chef,))
            nationalCuisineOfTheRecipe = [x[0] for x in cur.fetchall()][0]  # Assuming each recipe has only one national cuisine

            cur.execute("SELECT chefId FROM chefs_nationalCuisines WHERE nationalCuisineName = ?", (nationalCuisineOfTheRecipe,))
            chefs_that_can_execute_this_recipe = [x[0] for x in cur.fetchall()]

            # If there are chefs who can execute this recipe, assign the first one
            if chefs_that_can_execute_this_recipe:
                i = random.randint(1, len(chefs_that_can_execute_this_recipe)-1)
                cur.execute("INSERT INTO chefs_recipes (chefId, recipeName) VALUES (?, ?)", (chefs_that_can_execute_this_recipe[i], recipe_that_doesnt_have_chef))
  
        
    cur.execute("""
        SELECT c.chefId
        FROM chefs_nationalCuisines c
        LEFT JOIN chefs_recipes r ON c.chefId = r.chefId
        WHERE r.recipeName IS NULL
    """)
    chefs_without_recipes = [chef[0] for chef in cur.fetchall()]

    # Assign at least one recipe to chefs without any
    for chef_id in chefs_without_recipes:
        # Fetch the chef's cuisines
        cur.execute("SELECT nationalCuisineName FROM chefs_nationalCuisines WHERE chefId = ?", (chef_id,))
        chef_cuisines = [cuisine[0] for cuisine in cur.fetchall()]

        # Find recipes matching any of the chef's cuisines
        for cuisine in chef_cuisines:
            cur.execute("SELECT name FROM recipes WHERE nationalCuisine = ?", (cuisine,))
            possible_recipes = [recipe[0] for recipe in cur.fetchall()]

            # If recipes are found, assign the first one and break the loop
            if possible_recipes:
                cur.execute("INSERT INTO chefs_recipes (chefId, recipeName) VALUES (?, ?)", (chef_id, possible_recipes[0]))
                break
    conn.commit()
    conn.close()

assign_cuisines()
