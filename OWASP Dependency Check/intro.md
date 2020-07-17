### What is OWASP Dependency Check

[OWASP Dependency Check](https://jeremylong.github.io/DependencyCheck/index.html/): #9 of the OWASP Top 10 is "Using Components with Known Vulnerabilities." OWASP Dependency Check was designed to help mitigate this problem by analyzing code for known vulnerabilities. Dependency Check can be used as a CLI or with a suite of plugins including Maven, Gradle, Jenkins, SonarQube and more. 

Dependency Check works by identifying CPEs (Common Platform Enumerations) for each dependency and comparing them to a list of CVEs (Common Vulnerabilities and Exposures) from third party libraries such as the National Vulnerability Database. It then creates a report that allows you to quickly go through and view the possible dependency vulnerabilities in your application. While the report does quickly and easily present a list of dependencies with known vulnerabilities it can contain false positives and vulnerabilities that are not relevant to how you are using that specific dependency. It can be difficult correctly identify the risk of the issues presented.

v4
