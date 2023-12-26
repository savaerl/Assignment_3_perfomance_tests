# Use an official OpenJDK runtime as a parent image
FROM openjdk:23-jdk-slim

# Set the working directory in the container
ENV workdir="/tmp"

# The folder for keeping the results file
ENV results_dir="results"

ENTRYPOINT ["bash", "./install_jmeter.sh"]
# copying files for Jmeter along with the test plan
COPY jmeter/ ${workdir}/jmeter
COPY users_cud.jmx users.sh users.csv ${workdir}/

# Set the working directory to use when running the container
WORKDIR ${workdir}

ENTRYPOINT ["bash", "./users.sh"]