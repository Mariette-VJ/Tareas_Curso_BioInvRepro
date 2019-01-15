---
title: "ProyectoFinal_SegundoAvance_Mariette"
author: "Mariette Viladomat"
date: "April 23, 2018"
---

# Proyecto Final: Segundo Avance
#####   Mariette Viladomat Jasso

### Objetivo

Se cuentan con datos de tres metagenomas obtenidos de muestras del mismo sitio tomadas en diferentes tiempos a lo largo de un periodo total de un año y medio. Las muestras son provenientes de un tapete microbiano de Cuatro Ciénegas tras cambios ambientales en el sitio y se pretende conocer la diversidad de arqueas de los muestreos (dentro de cada muestreo y entre ellos).

Para realizar el obejtivo, estos metagenomas deberán ser pre procesados (eliminación de adaptadores y limpieza de calidades) para después realizar una predicción de OTUs. De las predicciones se eligirań las arqueas de las muestas, así como sus diversidades relativas y finalmente, con ellas, obtener las diveresidades alfa y beta de los diferentes muestreos. 

El nombre de los metagenomas a procesar:

PAzules_R1.fastq      
PAzules_R2.fastq

PAzules2_R1.fastq 
PAzules2_R2.fastq

PAzules3_R1.fastq     
PAzules3_R2.fastq

### Primera etapa: Identificación de adaptadores

fastqc PAzules*.fastq

Apartir de los datos de fastqc se observaron las siguientes secuencias sobrerepresentadas:

__PAZULES__

	$ grep -c '^@M03909' PAzules_R*.fastq
	 PAzules_R1.fastq:28859454
	 PAzules_R2.fastq:28859454

PAZULES R1: 

| Sequence                                           | Count| Percentage        | Possible Source       |
| ---------------------------------------------------|:----:| -----------------:| ---------------------:|
|ATCGGAAGAGCACACGTCTGAACTCCAGTCAC ATTCCTTT ATCTCGTATG| 55712| 0.1930459252624807|TruSeq Adapter, Index 8|
|GATCGGAAGAGCACACGTCTGAACTCCAGTCAC ATTCCTTT ATCTCGTAT| 43728| 0.1515205381224468|TruSeq Adapter, Index 8|

PAZULES R2:

| Sequence                                           | Count| Percentage        | Possible Source       |
| ---------------------------------------------------|:----:| -----------------:| ---------------------:|
| GATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCG | 47624|0.16502044702578225|	Illumina Single End PCR Primer 1|


__PAZULES2__

	$ grep -c '^@M03909' PAzules2_R*.fastq
	 PAzules2_R1.fastq: 4772053
	 PAzules2_R2.fastq: 4772053

PAZULES2 R1:

| Sequence                                           | Count| Percentage         | Possible Source       |
| ---------------------------------------------------|:----:| ------------------:| ---------------------:|
|CTCCTACGGGAGGCAGCAGTGGGGAATATTGCACAATGGGCGCAAGCCTG  | 5291 | 0.11087471157591922|     No Hit            | 

_SE OBSERVÓ UNA SECUENCIA REPRESENTADA EN UN % PEQUEÑO Y SIN UN POSIBLE ORIGEN IDENTIFICADO (no parece ser un Adaptador de Illumina). PARECIERA COMO QUE LA SECUENCIA SOBRE REPRESENTADA FUESE PARTE DE LOS DATOS BIOLÓGICOS. SIN EMBARGO, VOY A BUSCAR (con grep) LAS SECUENCIAS DE LOS ADAPTADORES QUE GENERALMENTE USAN EN EL LANGEBIO  PARA VERIFICAR QUE REALMENTE NO SE ENCUENTREN EN LOS READS_

TruSeq Indexed Adapter:  5 GATCGGAAGAGCACACGTCTGAACTCCAGTCAC‐NNNNNN‐ATCTCGTATGCCGTCTTCTGCTTG  3
[Referencia](https://www.med.unc.edu/pharm/calabreselab/files/tufts-sequencing-primer) 


	$ grep -c '^GATCGGAAGAGCACACGTCTGAACTCCAGTCAC' PAzules2_R1.fastq 
          2059    

	$ grep -c '^ATCGGAAGAGCACACGTCTGAACTCCAGTCAC' PAzules2_R1.fastq 
          4580

	SE IDENTIFICÓ ESTE BARCODE:
	       CCGTCCCG

	$ grep -c '^GATCGGAAGAGCACACGTCTGAACTCCAGTCAC CCGTCCCG ATCTCGTATGCCGTCTTCTGCTTG' PAzules2_R1.fastq     
          1604

	$ grep -c '^ATCGGAAGAGCACACGTCTGAACTCCAGTCAC CCGTCCCG ATCTCGTATGCCGTCTTCTGCTTG' PAzules2_R1.fastq
	        2516


	$ grep -c '^GATCGGAAGAGCACACGTCTGAACTCCAGTCAC CCGTCCCG ATCTCGTAT' PAzules2_R1.fastq
	        1662	  

	$ grep -c '^ATCGGAAGAGCACACGTCTGAACTCCAGTCAC CCGTCCCG ATCTCGTAT' PAzules2_R1.fastq
	  2844


_LO QUE VOY A HACER SERÁ SÓLO ELIMINAR LAS SECUENCIAS DE LOS ADAPTADORES IDENTIFICADOS CON GREP AL INICIO DEL READ (las que me constan que son adaptadores usados por el LANGEBIO)_

PAZULES2 R2:

No se encontraron secuencias sobre representadas

_IGUALMENTE SE BUSCARÁN CON grep PARA VERIFICAR QUE NO SE ENCUENTREN EN EL REAS, A PESAR DE QUE NO SE OBSERVEN SECUENCIAS SOBRE REPRESENTADAS_

	$ grep -c '^GATCGGAAGAGCACACGTCTGAACTCCAGTCACCCGTCCCGATCTCGTAT' PAzules2_R2.fastq
	  0

	$ grep -c '^ATCGGAAGAGCACACGTCTGAACTCCAGTCACCCGTCCCGATCTCGTAT' PAzules2_R2.fastq
	  0

	$ grep -c '^GATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCG' PAzules2_R2.fastq
	  1858




__PAZULES3__

	$ grep -c '^@M03909' PAzules3_R*.fastq
	 PAzules3_R1.fastq:  8203484
	 PAzules3_R2.fastq:  8203484

PAZULES3 R1:

| Sequence                                           | Count| Percentage        | Possible Source       |
| ---------------------------------------------------|:----:| -----------------:| ---------------------:|
|ATCGGAAGAGCACACGTCTGAACTCCAGTCAC CTGAAGCT ATCTCGTATG| 9366 |0.11417100344195223|TruSeq Adapter, Index 7|
|GATCGGAAGAGCACACGTCTGAACTCCAGTCAC CTGAAGCT ATCTCGTAT| 10100|0.12311842139266682|TruSeq Adapter, Index 7|

PAZULES3 R2:

| Sequence                                           | Count| Percentage        | Possible Source       |
| ---------------------------------------------------|:----:| -----------------:| ---------------------:|
|GATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGGATAGGGTGTAGATCT  |10593 |0.12912806314975442|	Illumina Single End PCR Primer 1|
|ATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGGATAGGGTGTAGATCTC  |9047  |0.1102824117167779 |	Illumina Single End PCR Primer 1|


### Segunda etapa: Limpieza de adaptadores

para eliminar los adaptadores, se utilizó el programa [cutadapt](https://cutadapt.readthedocs.io/en/stable/installation.html)

*PAZULES*

	$  cutadapt --trim-n -g ^GATCGGAAGAGCACACGTCTGAACTCCAGTCACGTGAAACGATCTCGTATGCCGTCTTCTGCTTG -g ^GATCGGAAGAGCACACGTCTGAACTCCAGTCACGTGAAACGATCTCGTAT -o PAzules_R1_cutadapt.fastq PAzules_R1.fastq

	$  cutadapt --trim-n -g ^GATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCG -o PAzules_R2_cutadapt.fastq PAzules_R2.fastq


*PAZULES 2*

	$ cutadapt --trim-n -g ^GATCGGAAGAGCACACGTCTGAACTCCAGTCACCCGTCCCGATCTCGTAT -g ^ATCGGAAGAGCACACGTCTGAACTCCAGTCACCCGTCCCGATCTCGTAT -o PAzules2_R1_bioawked_REPAIRED_cutadapt.fastq PAzules2_R1_bioawked_REPAIRED.fastq

	$ cutadapt --trim-n -g ^GATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCG -o PAzules2_R2_bioawked_REPAIRED_cutadapt.fastq PAzules2_R2_bioawked_REPAIRED.fastq


*PAZULES 3*

	$  cutadapt --trim-n -g ^ATCGGAAGAGCACACGTCTGAACTCCAGTCAC -g ^GATCGGAAGAGCACACGTCTGAACTCCAGTCAC -o PAzules3_R1_bioawked_REPAIRED_cutadapt.fastq PAzules3_R1_bioawked_REPAIRED.fastq

	$  cutadapt --trim-n -g ^GATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGGATAGGGTGTAGATCT -g ^ATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGGATAGGGTGTAGATCTC -o PAzules3_R2_cutadapt.fastq PAzules3_R2.fastq


### Tercera etapa: Join de PE y filtro de calidades

para unir los PE y filtrar por calidades, se utilizó el programa [PEAR](https://sco.h-its.org/exelixis/web/software/pear/)


*PAZULES*

	$  pear -f PAzules_R1_cutadapt.fastq -r PAzules_R2_cutadapt.fastq -q 20 -j 4 -o PAzules_cutadapt_PEAR_q20.fastq

*PAZULES 2*

	$  pear -f PAzules2_R1_cutadapt.fastq -r PAzules2_R2_cutadapt.fastq -q 20 -j 4 -o PAzules2_cutadapt_PEAR_q20.fastq

*PAZULES 3*

	$  pear -f PAzules3_R1_cutadapt.fastq -r PAzules3_R2_cutadapt.fastq -q 20 -j 4 -o PAzules3_cutadapt_PEAR_q20.fastq


PEAR genera cuatro archivos de salida:

*.assembled.fastq
*.discarded.fastq
*.unassembled.forward.fastq
*.unassembled.reverse.fastq