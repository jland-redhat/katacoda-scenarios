### Setup Security Realm

Now lets set up the Keycloak secuirity realm. This will serve as the *authorization* and *resource* server for our application to authenticate against. The realm will use the OpenId Connect protocol.

1. Validate your Keyclaok server is up by navigating to https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com:8081/ in a browser (`Keycloak Dashboard`)
    - It may take a minute for the container to start completly
2.  Login to keycloak
    - Click the "Administration Console" link
    - Default Login for Keycloak
      - Username: admin
      - password: admin 
    - Should now be on the "Master" realm settings
3. Create todoRealm
    - "Select realm" -> "Add Realm"
      - Name: `todoRealm`{{copy}}
      - Click Create
4. Create Client. The *Authorization Server* used to connect to KeyCloak
    - "Clients" -> "Create"
      - Name: `openid-login-client`{{copy}}
      - Client Protocol "openid-connect"
      - Click Create
    - Update client to allow for redirects from our localhost client application
      - Valid Redirect URLs: https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/*
      - Click save
5. Create Roles
    - Create "read_access" and "write_access" roles
      - Roles -> Add Role
        - Role Name: `read_access`{{copy}}
        - Click Create
        - Repeat for `write_access`{{copy}}
6. Create Test User
    - Users -> Add User
      - Username: `todo-user`{{copy}}
      - Email: forthenorth@thewall.org
      - First Name: Jon
      - Last Name: Snow
      - Email Verified: On
      - Click Save
    - Add Roles
      - `Role Mapping` tab
        - Select `read_access` and `write_access` from the Available Roles
          - Optional: Just add read access and come back and add write_access after TODO: Add specific step
        - Add selected
    - Add Credentials
      - Credentials Tab
        - Password/Password Confirmation: `password`
        - Temporary: Off
        - Click Reset Password
        - Confirm
