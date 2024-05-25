import sqlite3
import random


def choose_random_subset(input_list, min_length, max_length):
    # Ensure min_length and max_length are within valid bounds
    min_length = max(0, min(min_length, len(input_list)))
    max_length = min(len(input_list), max_length)
    
    if min_length > max_length:
        raise ValueError("min_length cannot be greater than max_length")
    
    # Generate a random length for the subset
    subset_length = random.randint(min_length, max_length)
    
    # Select a random subset of the generated length
    subset = random.sample(input_list, subset_length)
    
    return subset

def connect_db():
    return sqlite3.connect('../example.db')

def assign_cuisines():
    conn = connect_db()
    cur = conn.cursor()

    cur.execute("DELETE FROM chefs_recipes")

    # Fetch all chef IDs 
    cur.execute("SELECT *  FROM chefs_nationalCuisines")
    chefs_cuisines = cur.fetchall()
    
    # Fetch all recipes with their nationalCuisine
    cur.execute("SELECT name, nationalCuisine FROM recipes")
    recipes = cur.fetchall()

    for chef_cuisine in chefs_cuisines:         #otan enas chef kserei mia kouzina. gia kathe synatgi autis tis kouzinas dwstoy 2/3 pithanotita na kserei ti sintagi
        recipes_subset = [recipe for recipe in recipes if recipe[1] == chef_cuisine[1]]         
        for recipe in recipes_subset:
            if(random.randint(1, 3)>2):
                cur.execute("INSERT INTO chefs_recipes (chefId, recipeName) VALUES (?, ?)",(chef_cuisine[0], recipe[0]))               


    cur.execute("SELECT name,nationalCuisine FROM recipes")                         #
    x =  cur.fetchall()                                                             #
    cur.execute("SELECT DISTINCT recipeName FROM chefs_recipes")                    #   find recipes that dont have a chef
    y =  [x[0] for x in cur.fetchall()]                                             #
    recipes_without_chef = [recipe for recipe in x if recipe[0] not in y]           #
    print("the recipes that dont have chef are:")                                   #
    print(recipes_without_chef)                                                     #

    for recipe_without_chef in recipes_without_chef:                                                                                                                    #
        cur.execute("SELECT * FROM chefs_nationalCuisines WHERE nationalCuisineName = ?", (recipe_without_chef[1],))                                                    #
        chefs_that_can_execute_the_recipe =  [x[0] for x in cur.fetchall()]                                                                                             # assign chefs to those recipes
        chefs_that_we_will_define_to_execute_the_recipe = choose_random_subset(chefs_that_can_execute_the_recipe, 2, 4)                                                 #
        for chef_that_we_will_define_to_execute_the_recipe in chefs_that_we_will_define_to_execute_the_recipe:                                                          #
             cur.execute("INSERT INTO chefs_recipes (chefId, recipeName) VALUES (?, ?)",(chef_that_we_will_define_to_execute_the_recipe, recipe_without_chef[0]))       #


    cur.execute("SELECT name,nationalCuisine FROM recipes")                         #
    x =  cur.fetchall()                                                             #
    cur.execute("SELECT DISTINCT recipeName FROM chefs_recipes")                    #   find recipes that dont have a chef again
    y =  [x[0] for x in cur.fetchall()]                                             #
    recipes_without_chef = [recipe for recipe in x if recipe[0] not in y]           #
    print("the recipes that dont have chef are:")                                   #
    print(recipes_without_chef)                                                     #
        
    cur.execute("SELECT * FROM chefs_nationalCuisines")                         #
    x = cur.fetchall()                                                          #
    cur.execute("SELECT DISTINCT chefId FROM chefs_recipes")                    #   find chefs that dont have recipes
    y = [x[0] for x in cur.fetchall()]                                          #
    chefs_without_recipes = [element for element in x if element[0] not in y]   #
    print("the chefs that dont have recipes are")                               #
    print(chefs_without_recipes)                                                #


    while len(chefs_without_recipes)>0:
        for chef_without_recipes in chefs_without_recipes:         #otan enas chef kserei mia kouzina. gia kathe synatgi autis tis kouzinas dwstoy 2/3 pithanotita na kserei ti sintagi
            recipes_subset = [recipe for recipe in recipes if recipe[1] == chef_without_recipes[1]]         
            for recipe in recipes_subset:
                if(random.randint(1, 3)>2):
                    cur.execute("INSERT INTO chefs_recipes (chefId, recipeName) VALUES (?, ?)",(chef_without_recipes[0], recipe[0]))   


        cur.execute("SELECT * FROM chefs_nationalCuisines")                         #
        x = cur.fetchall()                                                          #
        cur.execute("SELECT DISTINCT chefId FROM chefs_recipes")                    #   find chefs that dont have recipes
        y = [x[0] for x in cur.fetchall()]                                          #   again
        chefs_without_recipes = [element for element in x if element[0] not in y]   #
        print("the chefs that dont have recipes are")                               #
        print(chefs_without_recipes)                                                #


    conn.commit()
    conn.close()

assign_cuisines()