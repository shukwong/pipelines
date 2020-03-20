

import "strelka.wdl" as strelka

workflow callGermlineVariants {

  #File inputSamplesFile
  #Array[Array[File]] inputSamples = read_tsv(inputSamplesFile)

  String runDir = "./strelka_run"
  #Array[File]+ bams
  #Array[File]+ indexes
  File inputSamplesFile
  Array[Array[File]] inputSamples = read_tsv(inputSamplesFile)
  File referenceFasta
  File referenceFastaFai
  File? callRegions
  File? callRegionsIndex
  Boolean exome = false
  Boolean rna = false
  Array[File]+ foo

  scatter (sample in inputSamples) {
     call strelka.GermlineGVCF {
       input: 
             runDir = runDir,
             bam = sample[1],
             index = sample[2],
             referenceFasta = referenceFasta,
             referenceFastaFai = referenceFastaFai,
             exome = exome,
             rna = rna
     }

      call hello {
        input:
          SAMPLE = sample[1]
      }
  }  
}

task hello {
    File SAMPLE
    
    command <<<
        echo "${SAMPLE}"
    >>>
    output {
        String messages = read_string(stdout())
    }
}