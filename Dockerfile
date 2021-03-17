FROM ubuntu:20.04
LABEL maintainer1="Oliver Josephs <o.josephs@fil.ion.ucl.ac.uk>"
LABEL maintainer2="Joerg Magerkurth <j.magerkurth@ucl.ac.uk>"

# BUCNI Dicom Server

# Install base packages
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && apt-get install -qq -y --no-install-recommends --no-install-suggests \
    ca-certificates \
    dcmtk \
    vim \
    less && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 11112

ENTRYPOINT ["storescp", "-od", "/data/dicoms", "-sp", "-fe", ".dcm", "11112"]
