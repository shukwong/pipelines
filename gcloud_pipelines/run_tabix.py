
import tabix


vcfurl = "ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz"

tb = tabix.open(vcfurl)


records = tb.query("21", 100000, 10000000 )  


for r in records:

       print ("\t".join(r))

