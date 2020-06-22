### Update OpenAPI Spec

First we need to add our security scheme changes to the OpenAPI Specification document.

`pom.xml`{{open}}
1. Add an OpenAPI Connect Security Scheme
    - Add the following at the "component" level of the `todo.yaml`
    ```yaml
    <pre class="file" >
    securitySchemes:
        todo-security:
            openIdConnectUrl: 'http://localhost:8081/auth'
            type: openIdConnect
    ```
    - Add global Security Requirements
      - Add the following at the application level
      ```yaml
      security:
        -
          todo-security: []
      ```
2. Regenerate Source code and validate
    - Run `mvn generate-sources`{{execute}}
    - View `gen/com/redhat/todo/TodosApi.java`{{open}}
    - Validate ApiOperation annotation contains `authorizations = {@Authorization(value = "todo-security")`
      - Note: Authorizaion annotations will be different once OpenAPI Generator switches from OpenAPI 2 to OpenAPI 3 annotations
