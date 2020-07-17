### Fix a vulnerability

View the CVE `CVE-2018-1000873`
  - The description says `Fasterxml Jackson version Before 2.9.8 contains a CWE-20: Improper Input Validation...`. So a version that 2.9.8 or newer should fix our issue
  - If you take a look at the other CVE's they all reference Jackson versions that are older than 2.9.7
  - You will note in the pom that we are not specifying the `jackson-databind` depdenency. The following command shows that it is a child of `jackson-datatype-jsr310`

Find `jackson-databind`'s parent dependency by running `mvn dependency:tree | grep -B 3 jackson-databind`{{execute}}


Add the following dependency to override the imported version of `jackson-databind`
  `
  <dependency>
      <groupId>com.fasterxml.jackson.core</groupId>
      <artifactId>jackson-databind</artifactId>
      <version>2.11.1(or latest version)</version>
  </dependency>
  `{{copy}}
  <sub> 2.11.1 is the latest version as of the creation of this lab. You should use the newest stable version currently out </sub>
  
Update Report:
`mvn verify
cp target/dependency-check-report.html /var/www/html/
`{execute}

Refresh Report: https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/dependency-check-report.html

You should note that `CVE-2018-1000873` was removed. It is also possible the entire `jackson-databind` dependency was removed if the newest version does not have another vulnerability associated with it.
Note: that while this *may* have removed `jackson-databind` from our report it does not mean our code is functioning properly. Always validate code when modifying dependencies. 
