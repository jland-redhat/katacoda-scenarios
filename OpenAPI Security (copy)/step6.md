### Setup Security Realm

Now lets set up the Keycloak secuirity realm. This will serve as the *authorization* and *resource* server for our application to authenticate against. The realm will use the OpenId Connect protocol.

1. Start your Keycloak server on port 8081
  ```sh
  podman run -d -p 8081:8080 -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin -e DB_VENDOR=H2  quay.io/keycloak/keycloak
  ```
2. Validate your Keyclaok server is up by navigating to `http://localhost:8081/` in a browser
    - It may take a minute for the container to start completly
3.  Login to keycloak
    - Click the "Administration Console" link
    - Default Login for Keycloak
      - Username: admin
      - password: admin 
    - Should now be on the "Master" realm settings
4. Create todoRealm
    - "Select realm" -> "Add Realm"
      - Name: todoRealm
      - Click Create
5. Create Client. The *Authorization Server* used to connect to KeyCloak
    - "Clients" -> "Create"
      - Name: openid-login-client
      - Client Protocol "openid-connect"
      - Click Create
    - Update client to allow for redirects from our localhost client application
      - Valid Redirect URLs: http://localhost:8080/*
      - Click save
6. Create Roles
    - Create "read_access" and "write_access" roles
      - Roles -> Add Role
        - Role Name: read_access
        - Click Create
        - Repeat for write_access
7. Create Test User
    - Users -> Add User
      - Username: todo-user
      - Email: forthenorth@thewall.org
      - First Name: Jon
      - Last Name: Snow
      - Email Verified: On
      - Click Save
    - Add Roles
      - Role Mapping tab
        - Select "read_access" and "write_access" from the Available Roles
          - Optional: Just add read access and come back and add write_access after TODO: Add specific step
        - Add selected
    - Add Credentials
      - Credentials Tab
        - Password/Password Confirmation: password
        - Temporary: Off
        - Click Reset Password
        - Confirm
