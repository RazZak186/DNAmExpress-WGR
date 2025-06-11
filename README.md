# DNAmExpress-WGR

**DNAmExpress-WGR** is a reproducible pipeline for integrated analysis of DNA methylation (DNAm) and whole-gene RNA expression (WGR) data. It supports both bulk and single-cell workflows and is designed for studies involving exposure models and developmental epigenetics.

## Features

- End-to-end WGBS and RNA-seq preprocessing
- Modular steps: QC, alignment, quantification, and statistics
- Integrated differential analysis of methylation and expression
- Optimized for HPC and reproducible with Conda/Snakemake

## Pipeline Workflow

1. **Preprocessing**
   - Quality control: FastQC, Trim Galore
   - Adapter trimming

2. **Alignment**
   - Bismark for WGBS [(Krueger & Andrews, 2011)](https://academic.oup.com/bioinformatics/article/27/11/1571/211312)
   - STAR for RNA-seq [(Dobin et al., 2013)](https://academic.oup.com/bioinformatics/article/29/1/15/272537)
   - HISAT2 as an alternative aligner [(Kim et al., 2015)](https://www.nature.com/articles/nmeth.3317)

3. **Quantification**
   - Methylation matrix generation (Bismark)
   - FeatureCounts/HTSeq for gene-level counts

4. **Statistical Analysis**
   - Differential expression: DESeq2 [(Love et al., 2014)](https://genomebiology.biomedcentral.com/articles/10.1186/s13059-014-0550-8) or edgeR [(Robinson et al., 2010)](https://genomebiology.biomedcentral.com/articles/10.1186/gb-2010-11-3-r25)
   - DMR analysis: methylKit or DSS
   - Exploratory methylation/coverage analysis with [SeqMonk](https://www.bioinformatics.babraham.ac.uk/projects/seqmonk/) (Babraham Institute)

5. **Integration**
6. **Genomic Feature Enrichment**
   - Analysis of methylation and expression patterns across genomic features such as **repeats** (LINEs, SINEs, LTRs) and **introns**
   - Uses RepeatMasker (open-4.0.5) and UCSC mm10 (GRCm38) genome annotations for intron boundaries [(Kent et al., 2002)](https://doi.org/10.1101/gr.229102)
   - Outputs include feature-level heatmaps and summary tables

   - Correlation between methylation and expression
   - Visualizations (heatmaps, PCA, volcano plots)

## Installation

```bash
git clone https://github.com/RazZak186/DNAmExpress-WGR.git
cd DNAmExpress-WGR
conda env create -f environment.yml
conda activate dnamexpress-wgr
```

## Running the Pipeline

```bash
snakemake --use-conda --cores 8
```

For job schedulers:

```bash
snakemake --use-conda --cluster "qsub -l walltime=24:00:00" --jobs 100
```

## Citation

If you use **DNAmExpress-WGR**, please cite it using the `CITATION.cff` file provided.

## License

This project is distributed for academic and research purposes only. For licensing or reuse beyond this scope, please contact the author.
