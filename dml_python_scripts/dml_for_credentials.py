import sqlite3

conn = sqlite3.connect('../example.db')
cur = conn.cursor()

# cur.execute('DELETE FROM credentials')


cur.execute("INSERT INTO credentials (username, password, isAdmin) VALUES (?, ? ,?)",("tzanetoast", "123456", 1)) 
    
# Fetch all chef IDs and names
cur.execute("SELECT id, firstName, lastName  FROM chefs")
chefs = cur.fetchall()
for chef in chefs:
    username = chef[1] + "_" + chef[2]
    username = username.lower()
    cur.execute("INSERT INTO credentials (username, password, chefId) VALUES (?, ? ,?)",(username, "123456", chef[0]))         


conn.commit()
conn.close()

