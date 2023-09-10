#!/bin/bash

csf_status=$(sudo csf -l | grep "csf and lfd have been disabled")

if [ -n "$csf_status" ]; then
  echo "csf_status 1" > /var/lib/node_exporter/textfile_collector/csf.prom
else
  echo "csf_status 0" > /var/lib/node_exporter/textfile_collector/csf.prom
fi
