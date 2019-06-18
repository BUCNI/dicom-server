FROM ubuntu:18.04
MAINTAINER Oliver Josephs <o.josephs@fil.ion.ucl.ac.uk>

# BUCNI Dicom Server

# Install base packages
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && apt-get install -qq -y --no-install-recommends --no-install-suggests \
    ca-certificates \
    dcmtk \
    vim && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["storescp", "-od", "/mnt/dicom", "-sp", "-fe", ".dcm", "11112"]
