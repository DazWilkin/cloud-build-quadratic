# [Rube Goldberg](https://en.wikipedia.org/wiki/Rube_Goldberg_machine) [Cloud Build](https://cloud.google.com/cloud-build) machine for [solving Quadratic equations](https://en.wikipedia.org/wiki/Quadratic_formula)

https://pretired.dazwilkin.com/posts/200928/


## Setup

```bash
echo "8" > a
echo "-10" > b
echo "3" > c
```

## Bash

```bash
./solve.sh`
```

yields:

```console
Quadratic: 8x²+-10x+3s=0
Roots are: .75000000000000000000; .50000000000000000000
```

## Docker

```bash
./docker.sh
```

yields:

```bash
Quadratic: 8x²+-10x+3s=0
Roots are: .75000000000000000000; .50000000000000000000
```

## Cloud Build

```bash
PROJECT=[[YOUR-PROJECT]]
BILLING=[[YOUR-BILLING]]

gcloud projects create ${PROJECT}

gcloud beta billing projects link ${PROJECT} \
--billing-account=${BILLING}

gcloud services enable cloudbuild.googleapis.com \
--project=${PROJECT}

gcloud builds submit ${PWD} \
--config=./cloudbuild.yaml \
--project=${PROJECT}
```

yields (edited):

```console
Step #0: Quadratic: 8x²+-10x+3s=0
Step #14: Roots are: .75000000000000000000; .50000000000000000000
```

Create a bucket if you wish to persist the root files to GCS:

```bash
BUCKET=[YOUR-BUCKET]
gsutil mb -p ${PROJECT} gs://${BUCKET}
```

Then:

```YAML
  # - name: busybox
  #   args:
  #     - ash
  #     - -c
  #     - "rm root1 root2"
artifacts:
  objects:
    location: "gs://[[YOUR-BUCKET]]/"
    paths:
      - "root1"
      - "root2"
```

And resubmit the build.
