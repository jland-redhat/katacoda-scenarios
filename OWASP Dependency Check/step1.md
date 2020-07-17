## Add Maven Plugin to the pom.xml

Copy:
    `
    <!-- OWASP Dependency Check -->
    <plugin>
        <groupId>org.owasp</groupId>
        <artifactId>dependency-check-maven</artifactId>
        <version>5.3.2</version>
        <executions>
            <execution>
                <goals>
                    <goal>check</goal>
                </goals>
            </execution>
        </executions>
      </plugin>
    `{{copy}}
    
Add to plugin section of `pom.xml`{{open}}
