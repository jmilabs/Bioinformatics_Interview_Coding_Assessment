# Bioinformatics Interview Coding Assessment

Please answer both sections to the best of your ability. Please reach out if you have any questions!

## Section 1: Parse Bracken Output
Within each file located in bracken_out/, create a new column reporting the percentage of assigned reads to each genus based upon the total_assigned_reads column. Exclude results which are less than 0.5% (0.005) in the final report.

This solution must be written in python and accept the following arguments:
    
* input folder
* limit of detection threshold, default = 0.005 (0.5%)
* outfile naming convention

Please use good documentation practices. Assume this task will be asked many more times in the future.

## Section 2: BLAST
Create a bash script to BLAST the sequences found in query/ against the Escherichia coli isolates in assembly/. Report hits that meet 95% or above identity in tab separated format for each input isolate. 


Once completed, create and submit code to applicant_scripts_XX/, the XX denoting your initials. 