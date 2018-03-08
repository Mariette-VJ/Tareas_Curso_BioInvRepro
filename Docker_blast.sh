#Ejercicio: ve a la página http://biocontainers.pro/docs/101/running-example/ y lee el ejemplo de cómo usar blast. 
#Escribe un script para adoptar el ejemplo de esta página a tu computadora. 
#Recuerda que si estás corriendo en Windows todo tendrás que hacerlo desde un contenedor de Docker
#Si tienes Linux o Mac puedes sólo correr el contenedor con el comando de blast en concreto. 
#Guarda tu script en tu repositorio de Github para las tareas del curso y brinda el link a dicho script:

#PARA LINUX

#Baja el contenedor con blast instalado
sudo docker pull biocontainers/blast

#Pide al contenedor, correr la ayuda del programa para verificar que esté funcionando
sudo docker run biocontainers/blast blastp -help

#EJERCICIO: We want to find out if the zebrafish, a model organism, has a prion protein similar to the human form.

mkdir Ejercicio_Docker_BLAST && cd Ejercicio_Docker_BLAST 

# 1. Downloading the huma prion FASTA sequence from UniProt

wget http://www.uniprot.org/uniprot/P04156.fasta

# 2. Downloading and unpacking the zebrafish database from NCBI

curl -O ftp://ftp.ncbi.nih.gov/refseq/D_rerio/mRNA_Prot/zebrafish.1.protein.faa.gz
gunzip zebrafish.1.protein.faa.gz

# 3. Running makeblastdb with the container to prepare the zebrafish database

sudo docker run -v ~/Escritorio/BioinfinvRepro/Unidad5/Prac_Uni5/Ejercicio_Docker_BLAST:/data/ biocontainers/blast makeblastdb -in zebrafish.1.protein.faa -dbtype prot

# 4. Make final alignments. The results will be saved on the results.txt file, then you can proceed to analyse the matches. 

sudo docker run -v ~/Escritorio/BioinfinvRepro/Unidad5/Prac_Uni5/Ejercicio_Docker_BLAST:/data/ biocontainers/blast blastp -query P04156.fasta -db zebrafish.1.protein.faa -out results.txt

#5. Analize matches.
# By looking the list of the best hits we can observe that zebrafish has a few predicted proteins matching to the human prion with better scores than 
# the predicted prion protein (score:33.9, e-value: 0.22). 
