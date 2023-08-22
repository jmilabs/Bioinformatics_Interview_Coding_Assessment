# Bioinformatics Interview Coding Assessment

Please answer both sections to the best of your ability. 

## Section 1: K-mer Composition
Provided the assembly files within assembly/, please find all 5-mer sequences and their occurance. This solution must be written in a python script and accept the following arguments:
    
* k-mer length (default = 5, can accept other int value)
* assembly folder name (default = assembly/)
* outfile (output containing k-mer sequences and their counts in tsv format with one k-mer per line. Each assembly file should have its own output)

Please use good documentation practices. Assume this task will be asked many more times in the future.


## Section 2: BLAST
Create a bash script to BLAST the sequences found in query/ against the Morganella morganii isolate in assembly/. Only report hits that meet a query coverage of 100% to standard output format. 

Commit code to applicant_scripts/. 
