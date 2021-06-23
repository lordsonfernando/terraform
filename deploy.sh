#!/bin/bash
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
PROTOBUF_DIR="protobuf"
PROTOBUF_FILE="schema.proto"
PROTOBUF_BQ_PLUGIN="/Users/ashwinknaik/go/bin/protoc-gen-bq-schema"
TF_DIR="tf"

deploy_tf() {
    terraform init
    terraform plan
    terraform apply -auto-approve
    terraform output -json > ${BASEDIR}/output.json
}

echo -e "generating Big Query Schema for ${BASEDIR}/${PROTOBUF_DIR}/${PROTOBUF_FILE}"
protoc --plugin=${PROTOBUF_BQ_PLUGIN} --bq-schema_out=${BASEDIR}/${TF_DIR} --proto_path=${BASEDIR}/${PROTOBUF_DIR} ${PROTOBUF_FILE}

cd ${BASEDIR}/${TF_DIR}
deploy_tf