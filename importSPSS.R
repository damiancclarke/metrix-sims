# This script uses the foreign library from R to convert a .sav file to
# a .dta file.  In the below code change FILE1 to the name of the .sav
# file (along with it's directory, for example "~/database/data.sav", and
# FILE2 to the place you want to export the file, ie "~/database/data.dta"
#
# This script can be run in Stata directly by typing the following at the
# command line:
#		!Rscript importSPSS.R "file1.sav" "file2.dta"
#
# Contact: damian.clarke@economics.ox.ac.uk

args<-commandArgs(TRUE)

cat("Importing SPSS file:", args[1], "\n")
cat("Exporting DTA file:", args[2], "\n")

spsstodta <- function(FILE1, FILE2) {
	library(foreign)
	data <- read.spss(FILE1, to.data.frame=TRUE)
	write.dta(data, FILE2)
}

spsstodta(args[1], args[2])
