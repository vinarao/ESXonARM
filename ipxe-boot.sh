#!/bin/bash
 
SSH_PUBLIC_KEY=`cat ~/vinay_ssh.pub`
SUBNET_ID="ocid1.subnet.oc1.uk-london-1.aaaaaaaaw5rpswosoowvdbatshxhgtya5a4ncltkdcolyxgyonh6fagimbqq"
COMPARTMENT_ID="ocid1.tenancy.oc1..aaaaaaaaz3vffq654srxtl5zbzqjs7sugln2xthz73inbiig62s3ggpb25fq"
AD="PuSg:UK-LONDON-1-AD-1"
# VERSION is a concatenation of the ESXi version without the "."s
VERSION="7"
SHAPE="BM.Standard.A1.160"
# IMAGE_ID is the AllZeros image (or representation thereof) that can be used as a blank canvas
IMAGE_ID="ocid1.image.oc1.uk-london-1.aaaaaaaaaazy7ngsg5wj3byvhhegi4rqcdiuv7zk6lozosjdvw3o6sqib2lq"
echo ${IMAGE_ID}
echo ${AD}
echo ${SUBNET_ID} 
oci compute instance launch \
--compartment-id=${COMPARTMENT_ID} --availability-domain=${AD} \
--image-id=${IMAGE_ID} \
--boot-volume-size-in-gbs=512 \
--ipxe-script-file=ipxeboot-7 \
--shape=${SHAPE} --display-name="arm-esxi1" --subnet-id=${SUBNET_ID} \
--metadata='{"ssh_authorized_keys": "'"${SSH_PUBLIC_KEY}"'" }'
