### Identifying False Positives and Irrelevant Depedencies

It is possible for this report to produce CVE's that do not match the dependency they are associated with. 

This is normally easily identifiable by reading the description or viewing the version information inside the linked data source

For example on our report if we examine `CVE-2018-10237` under `guava-20.0.jar`
  - The description reads `Unbounded memory allocation in Google Guava 11.0 through 24.x before 24.1.1 allows` meaning this is **NOT** a false positive
  - But if our version was 24.1.2 it could mean that there was human error when recording the CVE info
  
  
Not every vulnerability is going to apply to our application and there are times when there is not a fix currently or we are unable to upgrade to a clean version of the dependency.
  - In this case it is important that there is a plan in place for documenting these known vulnerabilities.

View `CVE-2018-1258` for the spring framework dependency
- Note that the description says this is only an issue when used in combination with Spring Security for authorization on methods.
  - If we are not planning on using Spring Security or not using method authorization it is possible this vulnerability is irrelevant to us.
  - **Important:** Again, if you do decide that a vulnerability should be ignore the reason should be justified and documented
