

# Created by Wendy Wong to run Octopus
#

#import "common.wdl" as common


task callGermlineOctopus {
    
    File bam
    File index
    File referenceFasta
    File referenceFastaFai
    File? callRegions
    File? randomForestFile
    String sampleName

    Int cores = 4
    Int memoryGb = 16 
    String dockerImage = "quay.io/shukwong/octopus:0.6.3b"
    

    command {
        octopus \
        -R ${referenceFasta} \
        -I ${bam} \
        ${"-t" + callRegions} \
        ${"--forest" + randomForestFile} \
        -o ${sampleName}.octopus.vcf.gz \
        --threads ${cores} 
    }

    output {
        File variants = "${sampleName}.octopus.vcf.gz"
    }

    runtime {
        docker: dockerImage
        cpu: cores
        memory: "${memoryGb}GB"
    }

    
}