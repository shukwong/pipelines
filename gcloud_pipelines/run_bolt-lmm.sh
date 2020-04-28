INPUT_DIR=gs://confluence_test/BOLT-LMM_v2.3.4/example
REF_DIR=gs://confluence_test/BOLT-LMM_v2.3.4/tables
OUTPUT_DIR=gs://confluence_test/BOLT-LMM_test_output
LOG_DIR=gs://confluence_test/BOLT-LMM_test_logs

gcloud beta lifesciences pipelines run \
    --regions us-east4 \
    --machine-type n1-standard-4 \
    --command-line 'bolt \
        --bfile=${BFILE} \
        --remove=${REMOVE} \
        --exclude=${EXCLUDE} \
        --exclude=${EXCLUDE1} \
        --phenoFile=${PHENOFILE} \
        --phenoCol=PHENO \
        --covarFile=${PHENOFILE} \
        --covarCol=CAT_COV \
        --qCovarCol=QCOV{1:2} \
        --modelSnps=${MODELSNPS} \
        --lmm \
        --LDscoresFile=${LDSCORESFILE} \
        --numThreads=2 \
        --statsFile={STATS_FILE} \
        --dosageFile=${DOSAGEFILE} \
        --dosageFile=${DOSAGEFILE2} \
        --dosageFidIidFile=${DOSAGE_FID_IID_FILE} \
        --statsFileDosageSnps=${STATS_FILE_DOSAGE_SNPS} \
        --impute2FileList=${IMPUTE2FILELIST} \
        --impute2FidIidFile=${EUR_subset.impute2.indivs} \
        --statsFileImpute2Snps=${STATS_FILE_IMPUTE2_SNPS} \
        --dosage2FileList=${EUR_subset.dosage2FileList.txt} \
        --statsFileDosage2Snps=example.dosage2Snps.stats \
        2>&1 | tee example.log # log output written to stdout and stderr' \
    --docker-image "biocontainers/bolt-lmm:v2.3.2dfsg-3b1-deb_cv1" \
    --env-vars BFILE=${INPUT_DIR}/EUR_subset \
    --inputs BED_FILE=${INPUT_DIR}/EUR_subset.bed \
    --inputs BIM_FILE=${INPUT_DIR}/EUR_subset.bim \
    --inputs FAM_FILE=${INPUT_DIR}/EUR_subset.fam \
    --inputs REMOVE=${INPUT_DIR}/EUR_subset.remove \
    --inputs EXCLUDE=${INPUT_DIR}/EUR_subset.exclude \
    --inputs EXCLUDE1=${INPUT_DIR}/EUR_subset.exclude2 \
    --inputs PHENOFILE=${INPUT_DIR}/EUR_subset.pheno2.covars \
    --inputs COVARFILE=${INPUT_DIR}/EUR_subset.pheno2.covars \
    --inputs MODELSNPS=${INPUT_DIR}/EUR_subset.modelSnps \
    --inputs STATS_FILE=${INPUT_DIR}/example.stats \
    --inputs LDSCORESFILE=${REF_DIR}/LDSCORE.1000G_EUR.tab.gz \
    --inputs DOSAGEFILE=${INPUT_DIR}/EUR_subset.dosage.chr17first100 \
    --inputs DOSAGEFILE2=${INPUT_DIR}/EUR_subset.dosage.chr22last100.gz \
    --inputs DOSAGE_FID_IID_FILE=${INPUT_DIR}/EUR_subset.dosage.indivs \
    --inputs IMPUTE2FILELIST=EUR_subset.impute2FileList.txt \
    --inputs IMPUTE2_FID_IID_FILE=EUR_subset.impute2.indivs \
    --inputs DOSAGE_TO_FILE_LIST=EUR_subset.dosage2FileList.txt \
    --outputs STATS_FILE=${OUTPUT_DIR}/example.stats \
    --outputs STATS_FILE_DOSAGE_SNPS=${OUTPUT_DIR}/example.dosageSnps.stats \
    --outputs STATS_FILE_IMPUTE2_SNPS=${OUTPUT_DIR}/example.impute2Snps.stats \
    --outputs STATS_FILE_DOSAGE2SNPS=${OUTPUT_DIR}/example.dosage2Snps.stats \
    --logging ${LOG_DIR}