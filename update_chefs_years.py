import sqlite3
from datetime import datetime

def update_ages():
    conn = sqlite3.connect('example.db')
    cur = conn.cursor()
    cur.execute("""
        UPDATE chefs
        SET age = (strftime('%Y', 'now') - strftime('%Y', dateOfBirth)) - (strftime('%m-%d', 'now') < strftime('%m-%d', dateOfBirth))
    """)
    cur.execute("""
        UPDATE chefs
        SET yearsOfExperience = (strftime('%Y', 'now') - strftime('%Y', dateOfExperienceStart)) - (strftime('%m-%d', 'now') < strftime('%m-%d', dateOfExperienceStart))
    """)
    conn.commit()
    conn.close()

# Assuming this function is called at application startup
update_ages()
