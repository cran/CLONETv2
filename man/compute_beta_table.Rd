% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CLONETv2_compute_beta_table.R
\name{compute_beta_table}
\alias{compute_beta_table}
\title{Function to compute beta table}
\usage{
compute_beta_table(seg_tb, pileup_tumor, pileup_normal,
  min_coverage = 20, min_required_snps = 10, min_af_het_snps = 0.2,
  max_af_het_snps = 0.8, n_digits = 3, n_cores = 1, plot_stats = F,
  debug = F)
}
\arguments{
\item{seg_tb}{data.frame in \href{http://software.broadinstitute.org/software/igv/SEG}{SEG format}. Rows
report per segment log2 ratio
numeric value. CLONETv2 inteprets first column as sample name, columns two
to four as genomic coordinates (chromosome, start location, and end
location), column five is not used, and column six is the log2 ratio
returned by segmentation algorithm.}

\item{pileup_tumor, pileup_normal}{data.frame reporting pileup of SNPs in
tumor and normal samples respectively. First row contains column names and
subsequent rows report the pileup of a specific genomic positions. Required
information for each genomic position includes
chromosome,    position,    allelic fraction, and    coverage. Required column names
are chr, pos, af, and cov}

\item{min_coverage}{minimum number of reads for considering a pileup position
valid (default=20)}

\item{min_required_snps}{minimum number of snps to call beta for a segment
(default=10)}

\item{min_af_het_snps}{minimum allowed allelic fraction of a SNP genomic
position (default=0.2)}

\item{max_af_het_snps}{maximum allowed allelic fraction of a SNP genomic
position (default=0.8)}

\item{n_digits}{number of digits in the output table  (default=3)}

\item{n_cores}{number of available cores for computation (default=1)}

\item{plot_stats}{plot summary statistics of the computed beta table (default=F)}

\item{debug}{return extra columns for debugging (default=F)}
}
\value{
A data.frame that extends input seg_tb with columns beta, nsnp, cov,
n_beta. Moreover, CLONETv2 renames colums of seg_tb as sample, chr,
start, end, XYZ, log2, with XYZ being the original name of column five
As for seg_tb, each raw of the output table represents a genomic
segments. For each raw,  the value of beta is the proportion of neutral
reads in the segment, while nsnp and cov represents respectively the number
of informative SNPs and the mean coverage of the given segment. The value
n_beta is the proportion of neutral reads in the normal sample. The value
of n_beta should be 1 as in normal samples parental chromosomes are equally
represented. Values lower than 1 of n_beta could indicate the presence of germline CNVs
or sequencing errors.
}
\description{
This function takes segmented data and per base pileup of tumor and matched
normal of a sample as input and associates a beta value to each genomic segment.
}
\examples{

## Compue beta table with default parameters
bt_toy <- compute_beta_table(seg_tb_toy, pileup_tumor_toy, pileup_normal_toy)
}
\author{
Davide Prandi, Alessandro Romanel
}
