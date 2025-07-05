from cs50 import get_string
from sys import argv

if len(argv) != 3:
    print('Usage: python dna.py data.csv sequence.txt')
    exit(1)

csv_file = open(argv[1], 'r')

list = []
test_subj = {}
for ind, row in enumerate(csv_file):
    if ind == 0:
        list = [strand for strand in row.strip().split(',')][1:]
    else:
        row_row = row.strip().split(',')
        test_subj[row_row[0]] = [int(x) for x in row_row[1:]]

dna_strand = open(argv[2], 'r').read()

final_list = []
for strand in list:
    i = 0
    max_strand = -1
    max_type = 0
    while i < len(dna_strand):
        windows_of_strand = dna_strand[i:i+len(strand)]
        if windows_of_strand == strand:
            max_type += 1
            max_strand = max(max_strand, max_type)
            i += len(strand)
        else:
            max_type = 0
            i += 1
    final_list.append(max_strand)

for name, data in test_subj.items():
    if data == final_list:
        print(name)
        exit(0)
print('No match')
