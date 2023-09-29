# Bioinformatics Interview Coding Assessment

Please answer both sections to the best of your ability. 

## Section 1: Parse Bracken Output
Provided the bracken reports within input_files/, find the average fraction of total reads per species identified between all input files. Do not include species whose average fraction of total reads are less than 0.005 (0.5%) in the final report. The final report must be in tab separated format.

This solution must be written in a python script and accept the following arguments:
    
* input folder
* average fraction of total reads minimum threshold, default = 0.005
* outfile naming convention

Please use good documentation practices. Assume this task will be asked many more times in the future.


## Section 2: BLAST
Create a bash script to BLAST the sequences found in query/ against the Staphylococcus aureus isolate in assembly/. Only report hits that meet a query coverage of 100% in tab separated format. 


Once completed, submit code to applicant_scripts_XX/, the XX denoting your initials. 