import os
import pandas as pd

def calculate_average_fraction(input_folder: str, threshold: float = 0.005, outfile: str = "final_report.txt"):
    """
    Calculate the average fraction of total reads per species identified between all input files.

    Parameters:
    - input_folder: str
        The path to the folder containing the input files.
    - threshold: float, optional
        The minimum threshold for the average fraction of total reads. Default is 0.005 (0.5%).
    - outfile: str, optional
        The name of the output file. Default is "final_report.txt".

    Returns:
    - None

    Raises:
    - FileNotFoundError:
        If the input folder does not exist.
    """

    # Check if the input folder exists
    if not os.path.exists(input_folder):
        raise FileNotFoundError(f"The input folder '{input_folder}' does not exist.")

    # Get a list of all input files in the input folder
    input_files = [f for f in os.listdir(input_folder) if os.path.isfile(os.path.join(input_folder, f))]

    # Initialize a dictionary to store the total reads per species
    total_reads = {}

    # Loop through each input file
    for file in input_files:
        # Read the input file as a pandas DataFrame
        df = pd.read_csv(os.path.join(input_folder, file), sep="\t")

        # Calculate the total reads per species in the current input file
        for index, row in df.iterrows():
            species = row["name"]
            reads = row["new_est_reads"]

            if species in total_reads:
                total_reads[species] += reads
            else:
                total_reads[species] = reads

    # Calculate the average fraction of total reads per species
    total_reads_sum = sum(total_reads.values())
    average_fractions = {species: reads / total_reads_sum for species, reads in total_reads.items()}

    # Filter out species whose average fraction of total reads is less than the threshold
    filtered_species = {species: fraction for species, fraction in average_fractions.items() if fraction >= threshold}

    # Write the final report to the output file
    with open(outfile, "w") as f:
        f.write("Species\tAverage Fraction of Total Reads\n")
        for species, fraction in filtered_species.items():
            f.write(f"{species}\t{fraction}\n")

# Example usage:
#input_folder = "input_files"
#threshold = 0.005
#outfile = "final_report.txt"
calculate_average_fraction("/Users/David/Element/Section1/reports/", 0.005, "final_report.txt")
