# SLEUTH Algorithm

SLEUTH extends the TreeMiner methodology to mine all frequent embedded or induced as well as ordered or unordered tree patterns. For TreeMiner see https://github.com/zakimjz/TreeMiner. For the tree generator see https://github.com/zakimjz/TreeGen


**Relevant Publications**

* [2005-sleuth:fi] Mohammed J. Zaki. Efficiently mining frequent embedded unordered trees. Fundamenta Informaticae, 66(1-2):33–52, Mar/Apr 2005. special issue on Advances in Mining Graphs, Trees and Sequences.


# HOW TO

1) The input must be in the following format:

id id length string_encoding

where id is repeated twice (the same value for the tree number), 

length is the number of items to follow on the line

string_encoding is the coding of the tree 

example: 

    0 0 7 1 2 -1 3 4 -1 -1
    1 1 11 2 1 2 -1 4 -1 -1 2 -1 3 -1
    2 2 15 1 3 2 -1 -1 5 1 2 -1 3 4 -1 -1 -1 -1

the first tree's string encoding has length 7 (including -1's), and so on.
This DB has 3 trees. 

This DB can also be converted to binary format if desired.

2) run sleuth as follows:

        sleuth -i XXX -s MINSUP
                where XXX is the full name of the DB
                      MINSUP is minsup in decimals (0.5 is 50%)
        other options are as follows:
                 -S use absolute support value
                 -o print frequent trees to STDOUT
		 -b if database is in binary format
		 -I for induced mining
	 	 -O for ordered mining
		(default is embedded and unordered mining)

The output has info about the freq trees at diff levels and the total
time taken.

Each line of the output is printed as follows:

tree string - embedded or induced support
