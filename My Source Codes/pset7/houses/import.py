# TODO
from cs50 import SQL
import csv
from sys import argv

if len(argv) != 2:
    print('Usage:python import.py filename.csv')
    exit(1)

db = SQL("sqlite:///students.db")

with open(argv[-1], "r") as characters:

    # Create DictReader
    reader = csv.DictReader(characters)

    # Iterate over TSV file
    for row in reader:
        birth = row['birth']
        house = row['house']

        names = row['name'].split()
        if len(names) == 3:
            first, middle, last = names
        else:
            first, last = names
            middle = None
        # Insert show
        db.execute("INSERT INTO students (first, middle, last, house, birth) VALUES(?, ?, ?, ?, ?)", first, middle, last, house, birth)

