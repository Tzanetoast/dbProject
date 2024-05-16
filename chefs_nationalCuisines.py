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
        chosen_cuisines = random.sample(cuisines, random.randint(1, int(len(cuisines)/3)))  # At least 2 cuisines per chef
        for cuisine in chosen_cuisines:
            cur.execute("INSERT INTO chefs_nationalCuisines (chefId, nationalCuisineName) VALUES (?, ?)",
                        (chef, cuisine))
    
    conn.commit()
    conn.close()

assign_cuisines()
