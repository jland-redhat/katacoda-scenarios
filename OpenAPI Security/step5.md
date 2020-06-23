### Code Walkthrough

The changes made in order to allow the spring-boot application to connect to keycloak have already been made. But lets quickly walk through them. If you would like to find out more information about this dependency or how to hook it up to spring security [here](https://www.baeldung.com/spring-boot-keycloak) is a link to a tutorial for doing just that.

1.  Inside the `pom.xml` we added the following dependency

  ```xml
  <!--Keycloak Dependency-->
  <dependency>
      <groupId>org.keycloak</groupId>
      <artifactId>keycloak-spring-boot-starter</artifactId>
      <version>10.0.1</version>
  </dependency>
  </dependencies>
  ```
  
2. We have added the following to `src/main/resources/application.properties`
  - Basic properties for connecting to the realm:
    ```properties
    #Keycloak Properties
    keycloak.auth-server-url=http://localhost:8081/auth
    keycloak.realm=todoRealm
    #Client
    keycloak.resource=openid-login-client
    keycloak.public-client=true
    ```
  - The keycloak starter library can take advantage of spring-boot's auto-configuration feature to set security on specific endpoint based on the `security-constraints` properties
    - Allow a user with the `read_access` role to use all GET methods under todos
    ```properties
    #Authorized Roles
    keycloak.security-constraints[0].authRoles[0]=read_access
    #Authorized Paths
    keycloak.security-constraints[0].securityCollections[0].patterns[0]=/v1/todos
    keycloak.security-constraints[0].securityCollections[0].patterns[1]=/v1/todos/*
    #Authorized Operations
    keycloak.security-constraints[0].securityCollections[0].methods[0]=GET
    ```
    - Allow a user with the `read_access` role use all methods under todos
    ```properties
    #Authorized Roles
    keycloak.security-constraints[2].authRoles[0]=write_access
    #Authorized Paths
    keycloak.security-constraints[2].securityCollections[0].patterns[0]=/v1/todos
    keycloak.security-constraints[2].securityCollections[0].patterns[1]=/v1/todos/*
    #Authorized Operations
    keycloak.security-constraints[2].securityCollections[0].methods[0]=GET
    keycloak.security-constraints[2].securityCollections[0].methods[1]=PUT
    keycloak.security-constraints[2].securityCollections[0].methods[2]=POST
    keycloak.security-constraints[2].securityCollections[0].methods[3]=DELETE
    ```
