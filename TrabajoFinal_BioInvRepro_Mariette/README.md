# Final Project - Mariette-VJ

### Main objective

Created for a Bioinformatic curse, this project pretends to create reproducible scientific results.

### Description

This project provides description and scripts on how to obtain relative abundance species predictions using metaphlan2 and MiSeq PE metagenomic data, already filtered and trimmed using PEAR. The final output files will be

1. a txt file with relative abundance of all species within each metagenome
2. a txt file with relative abundance of only archaea species within each metagenome
3. a table that allows to compare relative abundance of archaea species between all metagenomes provided
4. a bonus heatmap of 50 most abundant archaea species within all metagenomes provided.


### Prerequisites

Things you need to install before following any other instruction

Install metaphlan2 inside this repository

Make sure you have MiSeq PE metagenomic data. Data should not be raw and should have been joined using PEAR

```
use command line for generating PEAR output using q 20 trimming of reads

$ pear -f metagenome_R1_cutadapt.fastq -r metagenome_R2_cutadapt.fastq -q 20 -j 4 -o metagenome_PEAR_q20.fastq

for more information on how to use PEAR, view the following link: https://sco.h-its.org/exelixis/web/software/pear/

```

PEAR output files must show as follows:

metagenome.assembled.fastq 
metagenome.discarded.fastq 
metagenome.unassembled.forward.fastq 
metagenome.unassembled.reverse.fastq

You should compress all files except for the 'discarded.fastq' file into a tar.bz2 folder and place it inside de data folder of this repertorie. 

Repeat these steps for as many metagenomes you have to work with.

Remember that the output will be a comparative table so only work with the samples you want to compare at a time. So inside the folder, it should look like this:

```
$ ls data/

  metagenome1.tar.bz2
  metagenome2.tar.bz2
  metagenome3.tar.bz2

```

### Installing prerequisites

Install metaphlan2 inside this repository

```
for installation, follow the command lines as described

$ sudo apt-get update

$ sudo apt-get install mercurial

$ hg clone https://bitbucket.org/biobakery/metaphlan2

or add program using the next link: https://bitbucket.org/biobakery/biobakery/wiki/metaphlan2#rst-header-output-files

```

Make sure metaphlan is working correctly

```
$ cd metaphlan2

$ sudo apt-get install python-scipy

$ python ./metaphlan2.py -h

```

## Running scripts

Inside the scripts folder you should see two files with numbers indicating which one to run first and which one to run second.

```
$ ls scripts/

  1_Metaphlan2-script.sh
  2_Output-script.sh
  
```

Once you have your metagenomic data as mentioned inside the data folder and metaphlan2 installed and running properly, go ahead to the scripts folder and run them using bash on the order intended.

```
before running first script, you should change the names in metagenomes variable to the names of your own metagenomes (as written inside data folder)

$ bash  1_Metaphlan2-script.sh

before running second script, you should change the names in metagenomes variable to the names of your own metagenomes (as written inside data folder)

$ bash  2_Output-script.sh
    
```


## Obtaining Results

Pongas el la ruta de los directorios marcados como código. Así mismo, cuando tengas el nombre completo de los archivos output, ponlos, no namás digas un archivo txt que tendrá tal cosa.

First script output files, containing relative abundance of all species predicted within each metagenome, will be inside the 'predict_otus' folder.

```
$ ls predict_otus/
       	PAzules.txt 	
        PAzules2.txt 	
        PAzules3.txt      
```

First output file of the second script, containing only archaea species abundances. Second and third output file of second script will be located inside output folder and inside images folder within, respectively.

```
$ ls predict_otus/
        PAzules.Archaea.txt
        PAzules2.Archaea.txt
        PAzules3.Archaea.txt
        
$ ls output/
        images/
        merged_Archaea_abundance_table.txt

$ ls output/images/
        merged_Archaea_abundance_heatmap.png
        
```
## Author

Mariette Viladomat Jasso
