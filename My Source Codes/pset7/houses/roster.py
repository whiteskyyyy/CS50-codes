# TODO
from sys import argv
from cs50 import SQL
if len(argv) != 2:
    print('Usage:python roster.py housename')
    exit(1)

db = SQL("sqlite:///students.db")
rows = db.execute('SELECT * FROM students WHERE house = ? ORDER BY last, first', argv[-1])

for row in rows:
    if row['middle']:
        print(row['first'] + ' ' + row['middle'] + ' ' + row['last'] + ', born ' + str(row['birth']))
    else:
        print(row['first'] + ' ' + row['last'] + ', born ' + str(row['birth']))
