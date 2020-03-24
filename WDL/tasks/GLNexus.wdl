version 1.0

#Modified fromhttps://github.com/dnanexus-rnd/DeepVariant-GLnexus-WDL/blob/master/wdl/htsget_DeepVariant_GLnexus.wdl by Wendy Wong
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.


#import "common.wdl" as common

task GLnexus {
    Array[File]+ GVCFS
    String CONFIG
    String OUTPUT_NAME

    command {
        set -ex -o pipefail
        glnexus_cli --config "${CONFIG}"  "${write_lines(GVCFS)}"  > "${OUTPUT_NAME}.bcf"
    }


    runtime {
        docker: "quay.io/mlin/glnexus:v1.2.2"
        cpu: "8"
    }

    output {
        File merged_bcf = "${OUTPUT_NAME}.bcf"
    }

    parameter_meta {
        cores: {description: "The number of cores to use.", category: "advanced"}
        memoryGb: {description: "The amount of memory this job will use in Gigabytes.", category: "advanced"}
    }
}
