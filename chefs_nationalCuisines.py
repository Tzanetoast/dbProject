import sqlite3
import random

def connect_db():
    return sqlite3.connect('example.db')

def assign_cuisines():
    conn = connect_db()
    cur = conn.cursor()
    
    # Fetch all chef IDs and names
    cur.execute("SELECT id  FROM chefs")
    chefs = [x[0] for x in cur.fetchall()]
    
    # Fetch all cuisine names
    cur.execute("SELECT name FROM nationalCuisines")
    cuisines = [cuisine[0] for cuisine in cur.fetchall()]
    
    # Insert randomized cuisine associations for each chef
    for chef in chefs:
        chosen_cuisines = random.sample(cuisines, random.randint(2, int(len(cuisines)/4)))  # kathe chef apo 2 mexri 6 kouzines
        for cuisine in chosen_cuisines:
            cur.execute("INSERT INTO chefs_nationalCuisines (chefId, nationalCuisineName) VALUES (?, ?)",
                        (chef, cuisine))
            
    cur.execute("SELECT name FROM nationalCuisines")
    x = [cuisine[0] for cuisine in cur.fetchall()]

    cur.execute("SELECT DISTINCT nationalCuisineName FROM chefs_nationalCuisines")
    y = [cuisine[0] for cuisine in cur.fetchall()]

    nationalCuisinesWithoutChef = [element for element in x if element not in y]    
    if len(nationalCuisinesWithoutChef)>0:
        print("there exists a national cuisine without a chef and you should handle it")


    conn.commit()
    conn.close()

assign_cuisines()
