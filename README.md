> **Note:** This repository was created as part of the review for the publication:
>
> https://f1000research.com/articles/9-1141/v1
>
> to server as a recommendation that all NCBI Codeathons should follow the structure shown here rather than the current layout seen in:
>
> https://github.com/NCBI-Codeathons/
>

# Structural Variation Baylor College Codeathon 2019

In October 2019, 46 scientists from around the world participated in the first National Center for Biotechnology Information (NCBI) Structural Variation (SV) Codeathon at Baylor College of Medicine. The charge of this first annual working session was to identify ongoing challenges around the topics of SV and graph genomes, and in response to design reliable methods to facilitate their study

## Publication

[Methods developed during the first National Center for Biotechnology Information Structural Variation Codeathon at Baylor College of Medicine][pub], F1000Research 2020, 9:1141 

[pub]: https://f1000research.com/articles/9-1141/v1

## Methods

[Clouseau](Clouseau): rapid quality assessment of population-scale VCF files. As we progress from comparing SVs between a sample and its corresponding reference (capturing differences between a given sample and its reference genome) to large cohort genomic datasets (variants across multiple hundreds to thousands of samples), large variant call format (VCF) files are being generated. Generating these large VCF files often involves customized scripts or analysis methods leaving the possibility of human or other runtime errors. For example, undetected errors such as incomplete files or artificially missing data might be mistaken for real biological phenomena (deletions/truncations). Leaving these unchecked may lead to erroneous conclusions. We developed Clouseau to address these challenges. Clouseau is a command line tool allowing users to rapidly validate VCF file formatting, generate multiple QC statistics, providing rapid QC insights from the input VCF file.

[MasQ](MASQ): Metagenomic assemblies-focused Quality assessment. While metagenomic assemblies have significantly improved since the early days of the Human Microbiome Project (HMP), intragenomic and intergenomic repetitive sequences remain as confounders. Individual reads spanning microbial strains (either via long-read technology or by generating synthetic long-reads) may be pieced together to resolve variation within a given microbial community. However, this process is imperfect. A major concern is that detected structural variants could actually result from misassembled genomic data instead of actual strain-specific variation. The goal of this project is to identify errors in any metagenomic assembly based on both short and long read mapping, in the hope of eliminating some of the uncertainty and error in metagenomic studies. Examples of errors to detect include falsely called (false positive) inversions, chimeras (translocation), INDELs (less than 50 bases long), and replacements (large substitutions). We created a containerized quality control pipeline called MasQ to locate, classify, and rectify errors in metagenomic assemblies. Out of concern for the integrity of current and future metagenomic studies from short-read and long-read genome sequencing data, we found that the quality control of metagenomic assemblies could be substantially improved by using a combination of sequence alignment tools and VCF file outputs from SV callers such as Sniffles v1.0.832 and Manta v1.5.033. The resulting SV call sets are subsequently compared and merged using packages like Truvari v0.1.2018.08.1 and SURVIVOR19. The current version of MasQ neatly packages this workflow and integrates it with novel correction and validation steps to fix any erroneous contigs found.

[DeNovoSV](DeNovoSV): CNV detection and identification of de novo SV events using long reads. We developed a pipeline to identify de novo structural variants (SVs) from long-read (LR) sequencing data collected from trios (probands + parents). As described below, in a pilot study, we analyzed data from an individual who carries multiple de novo CNVs, initially identified by array-based comparative genomic hybridization (aCGH). Prior to this work, we lacked an integrated bioinformatics pipeline to identify high-confidence, de novo structural variants called from LR DNA sequencing (e.g., Oxford Nanopore Technology - ONT). Accordingly, to select further SV calls for orthogonal validation, we merged de novo LR SV calls with de novo SV calls independently identified by short-read (SR) DNA sequencing (i.e. PCR-free paired-end Illumina DNA sequencing, 150 paired-end reads, 40x depth of coverage) in this trio. DeNovoSV facilitates identification and prioritization of high-quality de novo SV calls that can be further validated by using targeted orthogonal methodologies such as Sanger sequencing or droplet digital PCR (ddPCR).

[SWIGG (SWIft Genomes in a Graph)](SWIGG): fast genome graph generation. There is a growing consensus across genomics that linear genome representation is suboptimal for representing variants across populations. While graph genomes have been steadily gaining popularity, many challenges remain (complexity, visualization, etc.). In this project, we developed a heuristic approach that quickly generates graphs and represents genomes in an efficient and succinct way. We created a simple algorithm and tool to build a graphical model that captures variability in the genomes at multiple scales. Moreover, there are regions across the human genome that are conserved among species while bearing modest amounts of variability that are suitable for understanding relationships of genome structure among individuals and/or organisms. We used a k-mer approach to create a sparse representation of such regions (anchors) at a large scale so as to allow visualizing the entire genome easily. These "anchored" graphs can then be further iteratively improved to include local sequence differences, and in turn, to help with genotyping existing variants and identifying new variants in new genomes.

[ASAP (Automated Structural Variation Annotation Pipeline)](ASAP). ASAP is an automated and robust pipeline to annotate structural variations. The pipeline integrates annotations including allele frequency, colocated gene, functional features, domains, regulatory elements, and transcription levels. To facilitate further development, we took a pseudo-multistage build approach. Specifically, during stage one, we pull the main program, AnnotSV v2.234 from its remote source, as we expect this step to change relatively infrequently and the program itself is large. In stage two, based on the previously-built base image, we pull in its dependencies including BEDtools v2.29.035 and build the docker. The workflow is as follows: 1.) User provides a VCF containing SV as input into AnnotSV 2.) AnnotSV annotates the variations and outputs a tab-delimited file 3.) the R script “postprocess.R” is used to process the TSV file generated by AnnotSV and extracts essential annotations like ranking score. AnnotSV has many default annotation sources (https://lbgi.fr/AnnotSV/), and can also accept user-provided annotations as input. The output of this pipeline used the default annotation.

[Super-minityper](super-minityper): graph making and graph-based read-mapping with GPUs in the cloud. We present a set of cloud-based workflows, composed mostly of preexisting and optimized tools, to 1.) construct graphs containing structural variants and 2.) map reads to these graphs. Our workflows allow users to make arbitrary SV calls, construct a graph, and map reads to these graphs. This workflow prioritizes ease-of-use and speed, accepting common input formats and returning results in minutes on commodity cloud virtual machines. Our approach is an example of what can be done now, and is generalizable to newer graph tools.

[ScanCNV](SCANCNV). Many current medical genomic studies still rely on CNV calling to identify de novo events that could have led to a certain disease phenotype. Nevertheless, a common problem for CNV detection is a high rate of false positives36 due to multiple biases in leading short-read sequencing technologies (e.g. GC bias, repetitiveness and general unevenness of the sequence data). To identify false positives and thus improve the reliability of CNV calling pipelines, we designed ScanCNV, which includes multiple QC steps. These QC steps currently include FASTQC v0.11.9, XYAlign v1.1.637, and Plink v2.038 where all the information is currently assembled and vetted within ScanCNV. Future work is still required to automate the process and fully leverage the obtained QC results.

## Participants

...

## Funding

...

## Other information

...
