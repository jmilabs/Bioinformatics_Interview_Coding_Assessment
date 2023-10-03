#!/bin/bash

# Function to perform BLAST on sequences against Staphylococcus aureus isolate.
# Only reports hits that meet a query coverage of 100% in tab-separated format.
# 
# Need to download command line BLAST and toolkit called SeqKit (doi:10.1371/journal.pone.0163962) for translation step
# @param $1: Path to the query sequences directory.
# @param $2: Path to the Staphylococcus aureus isolate assembly directory.
# @param $3: The output file name for hits with 100% query coverage.
blast_sequences() {
    local query_dir="$1"    # Capture the query directory passed as a parameter.
    local assembly_dir="$2" # Capture the assembly directory passed as a parameter.
    local output_file="$3"  # Capture the output file name passed as a parameter.
    
    # Check if the query directory exists
    if [ ! -d "$query_dir" ]; then
        echo "Query directory does not exist."
        exit 1
    fi

    # Check if the assembly directory exists
    if [ ! -d "$assembly_dir" ]; then
        echo "Assembly directory does not exist."
        exit 1
    fi
    
    # Create the output file.
    touch "$output_file"
    
    # Create protein translation given genomic fna given, checked against actual protein sequence and isn't exact match, but will give a result as requested nonetheless 
    
    seqkit translate "$assembly_dir/GCF_000013425.1_ASM1342v1_genomic.fna" -T 11 > "$assembly_dir/GCF_000013425.1_ASM1342v1_protein.fna"
    
    # Create protein db given the assembly provided
    makeblastdb -in "$assembly_dir/GCF_000013425.1_ASM1342v1_protein.fna" -dbtype 'prot' -out Staph_aur

    # Iterate over each query sequence file
    for query_file in "$query_dir"/*; do
        # Get the query sequence name
        query_name=$(basename "$query_file")

        # Perform BLAST on the query sequence against the Staphylococcus aureus  assembly
        blast_result=$(blastp -query "$query_file" -db Staph_aur -outfmt "6 qseqid sseqid pident length qcovs" | awk -v query_name="$query_name" '$5 == 100 {print query_name "\t" $2}')
        
        # Perform BLAST against the Staphylococcus aureus isolate assembly.
        #blast_result=$(blastn -query "$query_file" -db "$assembly_dir" -outfmt "6 qseqid sseqid pident length qcovs" | awk -v query_name="$query_name" '$5 == 100 {print query_name "\t" $2}')
 
        # Append the BLAST result to the output file.
        echo "$blast_result" > "$output_file"
        
    done
}

# Usage example for blast_sequences.sh

# Example: Blast the sequences in the "query" directory against the Staphylococcus aureus in the "assembly" directory and output to to file named "hits.txt".
blast_sequences "query/" "assembly/" "hits.txt"
