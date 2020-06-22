### Update OpenAPI Spec

First we need to add our security scheme changes to the OpenAPI Specification document.

1. Add an OpenAPI Connect Security Scheme
    - Add the following at the "component" level of the `todo.yaml`

    <pre class="file" data-filename="todo.yaml" data-target="#TODO: Add Security Scheme">
    securitySchemes:
        todo-security:
            openIdConnectUrl: 'http://localhost:8081/auth'
            type: openIdConnect
    </pre>
    - Add global Security Requirements
      - Add the following at the application level
    <pre class="file" data-filename="todo.yaml" data-target="#TODO: Add Security Scheme">
    security:
      -
        todo-security: []
    </pre>
2. Regenerate Source code and validate
    - Run `mvn generate-sources`{{execute T1}}
    - View `src/main/gen/com/redhat/todo/TodosApi.java`{{open}}
    - Validate ApiOperation annotation contains `authorizations = {@Authorization(value = "todo-security")`
      - Note: Authorizaion annotations will be different once OpenAPI Generator switches from OpenAPI 2 to OpenAPI 3 annotations
