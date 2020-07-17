### Run Check and View Dependency Check Report

Run the Dependency Check with `mvn verify`{{execute}}
<sub>Note: The plugin will need to download and process multiple CVE databases on the first run, so This make take a while initially.</sub>

Publish report:
`
sudo apt update
sudo apt -y install apache2
cp target/dependency-check-report.html /var/www/html/
`{execute}


View Report: https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/dependency-check-report.html

You can learn more about how to read the report by following the link at the top.
