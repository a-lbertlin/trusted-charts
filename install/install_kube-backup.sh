# install for the first time
# AWS S3
helm upgrade --install kube-backup spc/kube-state-backup --namespace stackpoint-system \
    --set schedule="*/50 * * * *",aws.enabled="true" \
    --set aws.accessKeyId="UNF37N93MG374B27",aws.secretAccessKey="AvgjbYndf9TMF8Y3F3J993TMTJ2309T" \
    --set aws.bucket="my-kube-state-backup-bucket",aws.region="eu-west-2" \
    --set jobCleanup.enabled="true"

# GCS
helm upgrade --install kube-backup kube-state-backup --namespace stackpoint-system \
    --set schedule="*/50 * * * *",gcs.enabled="true",gcs.projectId="project-123" \
    --set gcs.accessKeyId="GOOG74NFENMO3",gcs.secretAccessKey="8GNFEIUMFEFNW7NRIQRJ38RNRQRRR8" \
    --set gcs.bucket="my-kube-state-backup",gcs.region="eu" \
    --set jobCleanup.enabled="true"

# run upgrades e.g. for schedule or docker image change
helm upgrade kube-backup spc/kube-state-backup --reuse-values --set schedule="*/30 * * * *"
helm upgrade kube-backup spc/kube-state-backup --reuse-values --set imageTag="0.1.8"
