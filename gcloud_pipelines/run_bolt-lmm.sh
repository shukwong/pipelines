INPUT_DIR=gs://confluence_test/BOLT-LMM_v2.3.4/example
REF_DIR=gs://confluence_test/BOLT-LMM_v2.3.4/tables
OUTPUT_DIR=gs://confluence_test/BOLT-LMM_test_output
LOG_DIR=gs://confluence_test/BOLT-LMM_test_logs

gcloud beta lifesciences pipelines run \
    --regions us-east4 \
    --machine-type n1-standard-4 \
    --command-line 'cp ${BED_FILE} /gcloud-shared/EUR_subset.bed; \
        cp ${BIM_FILE} /gcloud-shared/EUR_subset.bim; \
        cp ${FAM_FILE} /gcloud-shared/EUR_subset.fam; \
        cp ${DOSAGEFILE2} /gcloud-shared/EUR_subset.dosage.chr22last100.gz; \
        cp ${LDSCORESFILE} /gcloud-shared/LDSCORE.1000G_EUR.tab.gz; \
        cp ${F1}  /gcloud-shared/EUR_subset.dosage2.chr17first100.map; \
        cp ${F2} /gcloud-shared/EUR_subset.dosage2.chr17first100.gz; \
        cp ${F3} /gcloud-shared/EUR_subset.dosage2.chr17second100.map;   \
        cp ${F4} /gcloud-shared/EUR_subset.dosage2.chr17second100; \
        cp ${F5} /gcloud-shared/EUR_subset.dosage2.chr22last100.map; \
        cp ${F6} /gcloud-shared/EUR_subset.dosage2.chr22last100.gz; \
        cp ${F7} /gcloud-shared/EUR_subset.impute2.chr17first100.gz; \
        cp ${F8} /gcloud-shared/EUR_subset.impute2.chr17second100; \
        cp ${F9} /gcloud-shared/EUR_subset.impute2.chr22last100.gz; \
        ls /gcloud-shared/; \
        zcat /gcloud-shared/EUR_subset.impute2.chr17first100.gz | head; \
        bolt \
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
        --LDscoresFile=/gcloud-shared/LDSCORE.1000G_EUR.tab.gz \
        --numThreads=2 \
        --statsFile={STATS_FILE} \
        --dosageFile=${DOSAGEFILE} \
        --dosageFile=/gcloud-shared/EUR_subset.dosage.chr22last100.gz \
        --dosageFidIidFile=${DOSAGE_FID_IID_FILE} \
        --statsFileDosageSnps=${STATS_FILE_DOSAGE_SNPS} \
        --impute2FileList=${IMPUTE2FILELIST} \
        --impute2FidIidFile=${IMPUTE2_FID_IID_FILE} \
        --statsFileImpute2Snps=${STATS_FILE_IMPUTE2_SNPS} \
        --dosage2FileList=${DOSAGE_TO_FILE_LIST} \
        --statsFileDosage2Snps=${STATS_FILE_DOSAGE2SNPS}' \
    --docker-image "quay.io/shukwong/bolt-lmm" \
    --env-vars BFILE=/gcloud-shared/EUR_subset \
    --inputs BED_FILE=${INPUT_DIR}/EUR_subset.bed \
    --inputs BIM_FILE=${INPUT_DIR}/EUR_subset.bim \
    --inputs FAM_FILE=${INPUT_DIR}/EUR_subset.fam \
    --inputs REMOVE=${INPUT_DIR}/EUR_subset.remove \
    --inputs EXCLUDE=${INPUT_DIR}/EUR_subset.exclude \
    --inputs EXCLUDE1=${INPUT_DIR}/EUR_subset.exclude2 \
    --inputs PHENOFILE=${INPUT_DIR}/EUR_subset.pheno2.covars \
    --inputs COVARFILE=${INPUT_DIR}/EUR_subset.pheno2.covars \
    --inputs MODELSNPS=${INPUT_DIR}/EUR_subset.modelSnps \
    --inputs LDSCORESFILE=${REF_DIR}/LDSCORE.1000G_EUR.tab.gz \
    --inputs DOSAGEFILE=${INPUT_DIR}/EUR_subset.dosage.chr17first100 \
    --inputs DOSAGEFILE2=${INPUT_DIR}/EUR_subset.dosage.chr22last100.gz \
    --inputs DOSAGE_FID_IID_FILE=${INPUT_DIR}/EUR_subset.dosage.indivs \
    --inputs IMPUTE2FILELIST=${INPUT_DIR}/EUR_subset.impute2FileList.txt \
    --inputs IMPUTE2_FID_IID_FILE=${INPUT_DIR}/EUR_subset.impute2.indivs \
    --inputs DOSAGE_TO_FILE_LIST=${INPUT_DIR}/EUR_subset.dosage2FileList.txt \
    --inputs F1=${INPUT_DIR}/EUR_subset.dosage2.chr17first100.map \
    --inputs F2=${INPUT_DIR}/EUR_subset.dosage2.chr17first100.gz \
    --inputs F3=${INPUT_DIR}/EUR_subset.dosage2.chr17second100.map   \
    --inputs F4=${INPUT_DIR}/EUR_subset.dosage2.chr17second100 \
    --inputs F5=${INPUT_DIR}/EUR_subset.dosage2.chr22last100.map \
    --inputs F6=${INPUT_DIR}/EUR_subset.dosage2.chr22last100.gz \
    --inputs F7=${INPUT_DIR}/EUR_subset.impute2.chr17first100.gz \
    --inputs F8=${INPUT_DIR}/EUR_subset.impute2.chr17second100 \
    --inputs F9=${INPUT_DIR}/EUR_subset.impute2.chr22last100.gz \
    --outputs STATS_FILE=${OUTPUT_DIR}/example.stats \
    --outputs STATS_FILE_DOSAGE_SNPS=${OUTPUT_DIR}/example.dosageSnps.stats \
    --outputs STATS_FILE_IMPUTE2_SNPS=${OUTPUT_DIR}/example.impute2Snps.stats \
    --outputs STATS_FILE_DOSAGE2SNPS=${OUTPUT_DIR}/example.dosage2Snps.stats \
    --logging ${LOG_DIR}