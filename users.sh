#!/bin/bash

# initiate the working directory
workdir=${workdir:-/tmp}
echo "Working directory is ${workdir}"

# initiate the results directory
results_dir=${results_dir:-results}
echo "Results directory is ${results_dir}"

# save the timestamp for the results file
timestamp=$(date +%Y-%m-%d-%H-%M-%S)

# full path to the logfile directory
logfile_path=${workdir}/${results_dir}/${timestamp}.jtl
echo "Path to the logfile is ${logfile_path}"

# full path to the results directory
report_dir_path=${workdir}/${results_dir}
echo "Path to the report folder is ${report_dir_path}"

# execute Apache JMeter test plan
java -jar jmeter/bin/ApacheJMeter.jar \
-n -f -t users_cud.jmx \
-l  ${logfile_path} \
-e -o ${report_dir_path} \
-j /dev/stdout
