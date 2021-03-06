\name{catDB-class}
\Rdversion{1.1}
\docType{class}
\alias{catDB-class}
\alias{catlist,catDB-method}
\alias{catmap,catDB-method}
\alias{coerce,list,catDB-method}
\alias{idconv,catDB-method}
\alias{names,catDB-method}
\alias{show,catDB-method}

\title{Class \code{"catDB"}}
\description{
Container for storing mappings of genes to annotation categories
such as gene ontologies (GO), pathways or conserved sequence domains.  
The \code{catmap} slot stores a \code{list} of \code{data.frames} providing the direct
assignments of genes to annotation categories (e.g. gene-to-GO mappings);
\code{catlist} is a \code{list} of \code{lists} of all direct and indirect associations to
the annotation categories (e.g. genes mapped to a pathway); and \code{idconv}
allows to store a lookup-table for converting identifiers (e.g. array feature
ids to gene ids). 
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("catDB", ...)}.
}
\section{Slots}{
  \describe{
    \item{\code{catmap}:}{Object of class \code{"list"} \code{list} of \code{data.frames} }
    \item{\code{catlist}:}{Object of class \code{"list"} \code{list} of \code{lists} }
    \item{\code{idconv}:}{Object of class \code{"ANY"} \code{list} of \code{data.frames} }
  }
}
\section{Methods}{
  \describe{
    \item{catlist}{\code{signature(x = "catDB")}: extracts data from \code{catlist} slot }
    \item{catmap}{\code{signature(x = "catDB")}: extracts data from \code{catmap} slot }
    \item{coerce}{\code{signature(from = "list", to = "catDB")}: \code{as(list, "catDB")} }
    \item{idconv}{\code{signature(x = "catDB")}: extracts data from \code{idconv} slot }
    \item{names}{\code{signature(x = "catDB")}: extracts slot names }
    \item{show}{\code{signature(object = "catDB")}: summary view of \code{catDB} objects }
	 }
}
\author{
Thomas Girke
}
\seealso{
\code{makeCATdb}, \code{GOHyperGAll}, \code{GOHyperGAll_Subset}, \code{GOHyperGAll_Simplify}, \code{GOCluster_Report}, \code{goBarplot} 
}
\examples{
showClass("catDB")
\dontrun{
## Obtain annotations from BioMart
listMarts() # To choose BioMart database
m <- useMart("ENSEMBL_MART_PLANT"); listDatasets(m) 
m <- useMart("ENSEMBL_MART_PLANT", dataset="athaliana_eg_gene")
listAttributes(m) # Choose data types you want to download
go <- getBM(attributes=c("go_accession", "tair_locus", "go_namespace_1003"), mart=m)
go <- go[go[,3]!="",]; go[,3] <- as.character(go[,3])
write.table(go, "GOannotationsBiomart_mod.txt", quote=FALSE, row.names=FALSE, col.names=FALSE, sep="\t")

## Create catDB instance (takes a while but needs to be done only once)
catdb <- makeCATdb(myfile="GOannotationsBiomart_mod.txt", lib=NULL, org="", colno=c(1,2,3), idconv=NULL)
catdb
}
}
\keyword{classes}
