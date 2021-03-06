% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CLONETv2_compute_allele_specific_scna_table.R
\name{compute_allele_specific_scna_table}
\alias{compute_allele_specific_scna_table}
\title{Function to compute allele specific somatic copy number}
\usage{
compute_allele_specific_scna_table(beta_table, ploidy_table,
  admixture_table, error_tb = error_table, allelic_imbalance_th = 0.5,
  n_digits = 3, n_cores = 1, debug = F)
}
\arguments{
\item{beta_table}{data.frame formatted as the output of function
\code{\link[CLONETv2:compute_beta_table]{compute_beta_table}}}

\item{ploidy_table}{data.frame formatted as the output of function
\code{\link[CLONETv2:compute_ploidy]{compute_ploidy}}}

\item{admixture_table}{data.frame formatted as the output of function
\code{\link[CLONETv2:compute_dna_admixture]{compute_dna_admixture}}}

\item{error_tb}{data.frame that reports for each combination of coverage and
number informative SNPs the expected estimation error around beta. The
data.frame error_tb must contains 3 columns: \describe{ \item{mean.cov}{mean
coverage} \item{n.info.snps}{number of informative SNPs}
\item{adm.estimation.error}{estimated error on computed beta on a segment
with coverage mean.cov and n.info.snps informative SNPs} } Package CLONETv2
have built in error_tb named error_table (default=error_table)}

\item{allelic_imbalance_th}{maximum distance from allele spefici copy number
of a segment to define integer alelle specific copy number value. Value 0.5
corresponds to round cnA and cnB (default=0.5)}

\item{n_digits}{number of digits in the output table  (default=3)}

\item{n_cores}{number of cores (default=1)}

\item{debug}{return extra columns for debugging (default=F)}
}
\value{
A data.frame that extends input beta_table with columns \describe{
\item{log2.corr}{log2 ratio adjusted by ploidy and admixture}
\item{cnA}{copy number of the major allele} \item{cnB}{copy number of the
minor allele} \item{cnA.int}{integet copy number of the major allele}
\item{cnB.int}{integet copy number of the minor allele} }
}
\description{
This function takes the beta table of a tumor sample together with the
associated ploidy and admixtures tables and computes the allele specific copy
number of each segment in the beta table.
}
\examples{

## Compute clonality table with default parameters
allele_specific_cna_table_toy <- compute_allele_specific_scna_table(
  beta_table = bt_toy, ploidy_table = pl_table_toy,
  admixture_table = adm_table_toy)

}
\author{
Davide Prandi
}
