version 1.0

# Developed by Wendy Wong
#
# This does not work yet, mainly because I have not figured out a way to tell cromwell which directory to mount in Docker
# gvcfgenotyper takes a file for the paths of the gvcfs instead of a list of input files


#import "common.wdl" as common

task gvcfgenotyper {
    File GVCFS_LIST
    File GENOME_REFERENCE
    String OUTPUT_NAME

    command {
        gvcfgenotyper -f ~{GENOME_REFERENCE} -l ~{GVCFS_LIST} -Ob -o ~{OUTPUT_NAME}.bcf    
    }


    runtime {
        docker: "quay.io/biocontainers/gvcfgenotyper:2019.02.26--hc088bd4_0"
        cpu: "8"
        disks: "local-disk, /data"
    }

    output {
        File merged_bcf = "{OUTPUT_NAME}.bcf"
    }

    parameter_meta {
        runDir: {description: "The directory to use as run/output directory.", category: "common"}
        cores: {description: "The number of cores to use.", category: "advanced"}
        memoryGb: {description: "The amount of memory this job will use in Gigabytes.", category: "advanced"}
    }
}