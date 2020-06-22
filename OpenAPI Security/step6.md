### Validate oAuth 

Validate 

1. Start spring-boot application
  ```sh
  mvn spring-boot:run
  ```
2. Navigate to `localhost:8080/swagger-ui.html`
3. Note you should see an open padlock symbol on all of the endpoints you have secured
4. Attempt to hit the `/todos` endpoint through the swagger page
  - Will return a "TypeError: Failed to fetch" error
  - SwaggerUI for OpenAPI 2.0 currently can not do redirect to the authorization page directly through the UI.
5. Start oAuth 2.0 flow
  - Navigate to `http://localhost:8080/v1/todos` in a new window (`Todos Endpoint` dashboard)
    - Should be forwarded to KeyCloak login page
    - Note you are now on "localhost:8081"
    - Login page should be for the "TODOREALM"
  - Login to keycloak
    - user:todo-user
    - password: password  
  - Should be redirected to back to "localhost:8080" with a set of results
6. Explore the swagger-ui's todos endpoints
  - Executing any of the GET endpoints on the swagger ui should return a 200
    - The *authorization token* is now being stored by the application on the backend.
    - Note: If you followed the optional task above and did not include the "write_access" then all non-GET methods will return a 403
      - Return back to the KeyCloak server's todo-user config page
      - Add the "write_access" role from the roles tab
      - Refresh your *authorization token*
        - Restart spring-boot application
        - Navigate to "http://localhost:8080/v1/todos" in a new browser window
7. Expore OpeniD Connect's Identity Layer
  - Run the "/user/details" endpoint in the OpenAPI controller
    ```json
    {
      "exp": 1592311027,
      "iat": 1592310727,
      "auth_time": 1592309991,
      "jti": "06fba00f-390a-4fd3-bd01-a3cd9a9ff450",
      "iss": "http://localhost:8081/auth/realms/todoRealm",
      "aud": "openid-login-client",
      "sub": "7f2387cb-4773-4478-9715-50f2826be1dd",
      "typ": "ID",
      "azp": "openid-login-client",
      "session_state": "7b2f6b84-df0d-499d-9544-cd1b9561296c",
      "name": "Jon Snow",
      "given_name": "Jon",
      "family_name": "Snow",
      "preferred_username": "todo-user",
      "email": "forthenorth@thewall.org",
      "email_verified": true,
      "acr": "0"
    }
    ```
      - Contains information about the token
        - iss: Issuer
        - exp: Token Expiration date
        - iat: Issued at
      - Contains the OpenID Connect "Identity Layer" infomration about the user 
        - given_name: First Name
        - family_name: Last Name
        - email: Email
  - More information about the different values can be found [here](https://www.iana.org/assignments/jwt/jwt.xhtml)

