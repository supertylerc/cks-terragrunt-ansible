#!/bin/bash
region="${1}"
ip_range="${2}"
doctl\
  vpcs\
    create\
      --ip-range "${ip_range}"\
      --region "${region}"\
      --name "default-${region}-dummy"\
> /dev/null 2>&1\
|| true
