### Suppressing Report Vulnerability

Once it is determined a CVE does not apply to your application it can be suppressed so it does not show up on future reports.

Let's suppress `CVE-2018-1000632` for `dom4j-1.6.1.jar`
  - View Report
  - Click the `suppress` button next to the link for the CVE `CVE-2018-1000632`
  - Since this is the first item we want to suppress click the `Complete XML Doc`
  - Paste the contents into a new file named `owasp-suppressions.xml`{open} in the project's base directory
  - Add the following to the `dependency-check-maven` plugin inside your `pom.xml`
  
      `
      <configuration>
        <suppressionFile>owasp-suppressions.xml</suppressionFile>
      </configuration>
      `{copy}
      
      <sub><suppressionFile> can be a local path, an absolute path, or a url location<sub>
 - Rerun `mvn verify`{execute} and validate that `CVE-2018-1000632` is no longer being recorded.
 - (Optional) Suppress some of the other CVEs on the page by adding the suppression clips to our XML document
  
