---
title: "Resumen-Equipo_BLAST_ShotgunMetagenomics_GenomasBacterianos"
author: "Mariette Viladomat, Yetsi Mancilla y Erika Alejandra"
date: "21 de marzo de 2018"
output: html_document
---

# Equipo Microorganismos

* SMG :  Comparación de comunidades microbianas a partir de datos metagenómicos tipo shotgun -- Mariette Viladomat
* GA : Ensamble de novo de genoma bacteriano -- Yetsi Mancilla
* BL : BLAST de proteína específica de hongos en genomas y metagenomas de bases de datos públicas -- Erika Alejandra


# Analisis metagenomicos 

La metagenómica se ha definido como "el análisis genómico" de microorganismos por extracción directa y clonación de ADN de un conjunto de microorganismos (Handelsman 2004). El trabajo pionero en el análisis de metagenómica se realizó por Venter et al. en el Mar de los Sargazos. 

Los objetivos de los estudios metagenómicos incluyen la caracterización completa de una comunidad, y por lo tanto generalmente incluye esfuerzos para comprender: 1) composición/estructura de lacomunidad, incluyendo el desglose taxonómico y la abundancia relativa de las diversas especies, 2) contribución génica de cada miembro de la comunidad, incluyendo el número y capacidad funcional, y 3) dentro de la especie o dentro de la población la heterogeneidad de los genes. Con los análisis metagenómicos  Idealmente, uno sería capaz de reconstruir completamente todos los genomas dentro de una muestra dada. Sin embargo, este objetivo particular ha sido en gran medida inalcanzable debido a limitaciones tecnológicas en el aislamiento bacteriano/recuperación del ADN así como en la capacidad de secuenciación (costo y rendimiento). (Matthew 2012).

__¿Cuáles son las principales variantes del método de laboratorio para generar mis datos y cuándo es más útil cada una?__

__SMG:__ La principal variante de laboratorio para obtener una comparación entre muestreos metagenómicos se observa en el tipo de datos moleculares que se utilizan para el estudio: _amplicones de 16S_, _amplicones de 18S_ o _datos tipo shotgun_. Los amplicones son muy útiles cuando se desea únicamente conocer la presencia o ausencia de organismos en la comunidad muestreada,  así como los índices de diversidad taxonómica de dichos organismos([Kreisinger et al, 2017](https://www.frontiersin.org/articles/10.3389/fmicb.2017.00050/full)). Las ventajas al usar marcadores conocidos para estos estudios es lo bien anotadas que están las bases de datos y la cantidad de [programas especializados](http://www.bushmanlab.org/assets/pdf/publications/20383131.pdf) para generar los resultados sin quimeras. Sin embargo, los amplicones no permiten observar el potencial metabólico de la comunidad. Para tener esa información  biológica, se requiere todo el ADN de todos los organismos en la muestra: datos tipo shotgun ([White III et al, 2015](https://www.researchgate.net/publication/282431849_Metagenomic_analysis_reveals_that_modern_microbialites_and_polar_microbial_mats_have_similar_taxonomic_and_functional_potential)).

_BL_ En la siguiente tabla se muestra los diferentes tipos de marcadores usados en metagenómica en el estudio con amplicones. 
	

__¿Qué limitantes y posibles fuentes de error puede presentar este método (en el laboratorio o la bioinformática)? ¿Qué puede hacerse para amortiguarlos?__

__SMG:__ Una fuente de error muy evidente es no contar con bases de datos homogéneas de la metadata (parámetros ambientales). No se tienen parámetros establecidos y homogéneos por sitios de muestreo específicos; por ejemplo, parámetros universales que deben medirse en muestras de microbioma y parámetros universales que deben medirse en muestras de suelos o aguas continentales, etc. Esto genera un problema porque la interpretación de los resultados de datos metagenómicos es muy dependiente de la información ambiental que se tenga. Una segunda fuente de error no tan evidente al interpretar los resultados y hacer las comparaciones por muestreo, es la covertura de secuenciación de los datos y la complejidad de la comunidad muestreada. Si tienes cinco muestras muy complejas secuenciadas en una sola placa de Illumina tendrás menos reads por muestra que si las secuencías en placas separadas. También el [método de secuenciación y la longitud de los reads](https://www.illumina.com/systems/sequencing-platforms/miseq/specifications.html) generará muchas diferencias en las muestras que serán independientes de la información biológica de la comunidad. Si no se tiene eso en cuenta, al comparar la diversidad de un muestreo complejo con millones de reads contra un muestreo complejo con sólo miles de reads, se observará más diverso el de millones y menos diverso el de miles y no necesariamente porque hayan más organismos diferentes en el primero y menos en el segundo. Una manera de evitar el error al inferir índices de diversidad, es normalizar los datos para que todos sean comparables, independientemente de la diferencia en el número de reads.

_BL_ Empezando con la extracción del material genético, es importante que todas las muestras se obtengan con el mismo kit de extracción para poder tener la misma calidad en todas las muestras. Una vez extraída la muestra se tiene que verificar la integridad de todas las muestras, ya que si alguna se encuentra degradada y no nos damos cuenta, nos puede generar interpretaciones erróneas. También es importante la cuantificación de las muestras ya que si varia la cantidad de DNA de cada muestra, la interpretación de los datos puede variar. También es importante considerar los errores de amplificación durante el PCR,  las mutaciones que se pueden generar durante la amplificación también nos podría llevar a interpretaciones erróneas en el análisis de los datos. Los errores generados por PCR incluyen mutaciones puntuales y formación de moléculas quiméricas. La tasa de errores de PCR es aproximadamente 10%. Una secuencia de 250 pb contienen uno o más errores cuando se amplifica (Kobayashi et al. 1999). Se ha demostrado que los errores en la secuenciación incrementan la estimación de la diversidad real en dos órdenes de magnitud (Kunin, 2010).  Para amortiguar este tipo de errores se han desarrollado diversos programas como AmpliconNoise que elimina errores de amplificación por PCR. También se han desarrollado programas específicos para detectar secuencias quiméricas generadas por el PCR. 

•	Chimera Check
•	Chimeric Alignment
•	ChimeraSlayer
•	Uchime
•	Perseus


__¿El muestreo requiere algún diseño específico? Por ejemplo, si se quiere secuenciar un genoma de novo ¿qué individuo sería ideal? Si trabajo con trascriptomas, ¿cómo afecta el tejido, la edad, las condiciones, etc. mi muestreo?__

__SMG:__ Todos los muestreos deberán diseñarse a parir de la pregunta biológica a contestar. En mi caso, requiero que todas las muestras sean tapetes microbianos y que los sitios de muestreo sean tanto en el mismo punto pero diferentes tiempos, como en sitios geográficamente distantes y ecológicamente diferentes. Todos los muestreos, tanto propios como obtenidos de bases de datos, deberán tener metadata bien anotada y haber sido secuenciados con la plataforma de Illumina. 

_BL:_  Otro punto importante en las condiciones de las muestras es la época del año o temporada en la que se llevo acabo la colecta de la muestra (primavera, verano, otoño e invierno), y mas si queremos que el estudio sea reproducible. También considero importante la forma en la que se transporta la muestra y su almacenamiento hasta poder ser procesada. Si se somete la muestras a diferentes condiciones es posible que los resultados sean diferentes, aunque la muestra sea del mismos sitio. 

__Menciona al menos dos softwares principales que se utilicen para realizar la parte medular de los análisis bioinformáticos de este tipo de análisis (e.g. si es ensamblado de novo con qué se ensambla, no con qué se hace el pre-procesamiento) y cuáles son los pros y contras de cada uno.__

__SMG:__ Existen varios [programas para realizar diferentes análisis metagenómicos](https://molbiol-tools.ca/Genomics.htm#Metagenomics). Sin embargo, uno de los pasos medulares para hacer la comparación en la diversidad taxonómica de las muestras es la predicción de OTUs. Los programas de predicción taxonómica generalmente cuantifican el número de organismos por muestra (abundancia relativa) tras su identificación. En general, existen dos métodos a través de los cuales se identifican los taxones en las muestras metagenómicas ([Lindgreen et al, 2016](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4726098/pdf/srep19233.pdf); [Teo and Neretti, 2016](https://www.biorxiv.org/content/biorxiv/early/2016/10/15/081141.full.pdf); [Dadi et al, 2016](https://peerj.com/articles/3138/)). 

El primer método se basa en preparar una base de datos con secuencias clado específicas (secuencias que no comparten regiones con las secuencias de otros clados de la misma jerarquía taxonómica). Con este método se puede garantizar obtener sólo una asignación de clado de una lectura de la muestra, incluso si sólo se usara una fracción de los datos metagenómicos secuenciados. Programas como MetaPhlAn2 ([Truong et al, 2015](https://www.nature.com/articles/nmeth.3589)), GOTTCHA ([Freitas et al, 2015](https://academic.oup.com/nar/article/43/10/e69/2409024)) y mOTUs ([Sunagawa et al, 2013](https://www.nature.com/articles/nmeth.2693)) usan este método. El segúndo método se basa en el uso de secuencias de referencia de una base de datos para asignarle a las lecturas ambiguas un ancestro común (LCA) en un árbol taxonómico. Kraken ([Wood & Salzberg, 2014](https://genomebiology.biomedcentral.com/articles/10.1186/gb-2014-15-3-r46)), un programa de binning de reads por clustering mediante k-meros, es un ejemplo de ese método. En cuanto a las ventajas y desventajas de cada método, el primero es más rápido y preciso pero se limita a las lecturas que pueden ser mapeadas de manera única a las regiones curadas/seleccionadas, mientras que el segundo método sufre de la capacidad de mapear lecturas a una jerarquía taxonómica más específica. 
