## Security Schemes Intro

In OpenAPI 3.0 secuirty schemes are how we define the way in which we want to restrict user's allowed to access our applicaiton based on some sort of authentication. They are defined at the at the "componenet" level (similar to our data schemas) using the "secuirtySchemes" field. Currently OpenAPI 3.0 supports four main "types" of secuirty schemes. Below is a very brief overview of each of these supported type, but more detailed information can be found in the OpenAPI documentation [here](https://swagger.io/docs/specification/authentication/)

Types of securitySchemes:

  - [HTTP](https://swagger.io/docs/specification/authentication/): Uses the value in the *Authorization* header
    - "scheme":
      - [Basic](https://en.wikipedia.org/wiki/Basic_access_authentication)
        - Authentication requiring a username and password using base64 encryption
        - Format: `Authorization: Basic base64(username:password)`
        - Least secure type of security. Base64 is easily decoded and should only buse used with HTTPS/SSL
          - This really holds true for all secure connections over HTTP
      - [Bearer](https://en.wikipedia.org/wiki/OAuth) 
        - Authentication that uses a token generated from logging into another server
        - Format: `Authorization: Bearer <TOKEN>`
        - Can be part of an oAuth 2 flow but does not have to be
      - [Digest](https://en.wikipedia.org/wiki/Digest_access_authentication)
        - Authentication in which the initial call to the server return 401 Unauthorized, with a nonce(random number) used in a follow-up call with an MD5 hash including that value
      - Any other schema defined by [RFC 7235](https://tools.ietf.org/html/rfc7235) and [HTTP Authentication Scheme Registry](https://www.iana.org/assignments/http-authschemes/http-authschemes.xhtml)
      
    Example:
    ```yaml
    securitySchemes:
      my_http_security_schema:
          scheme: basic
          type: http
    ```
      
  - [API Keys](https://swagger.io/docs/specification/authentication/api-keys/): A flexible way in which you can specify the key you want to use for authentication
    - "in":
      - header
      - query
      - cookie
      
    Example:
    ```yaml
    securitySchemes:
      my_api_security_schema:
          type: apiKey
          name: key
          in: header
    ```
  - [oAuth 2](https://swagger.io/docs/specification/authentication/oauth2/): An api protocol that gives api client limited access to user's data on a separte web server
    - Uses a flow based approache which involves retrieving user info from a seprate resource server after the user allows client api access to some or all of that user's data
    - Flows:
      - Authorization Code: Most common type of flow, used for most server side applications.
        - General Flow:
          - *User* request to login to *Client Application*
          - *Client Application* redirects *User* to *Authorization Server*
          - *Authorization Server* request *User* login and give permissions specified in scope to the *Client Application*
          - Validate credentials and redirect *User* to *Client Application* with a short lived *Authorization Code*
          - *Client Application* uses *Authorization Code* to retrieve *Access Token*
          - *Access Token* Used to retireve data about the *User* from the *Resource Server* 
            - *Access Token* can come an differnt forms such as JWT and can contain more than just the data used to access the *Resource Server*
      - Implicit: Just retrieves *Access Code* rather than token. Used for client side application or anywhere you would not want to store the token data. 
        - Flow similar to the "Authorization Code Flow" flow above, but without retrieving the token
      - Password Flow: Used for first party application which requiure user to enter credentials on *Client Application*
        - Flow similar to "Authorization Code Flow", only client credentials are passed in with redirect to *Authorization Server*
      - Client Credentials Flow: Flow used form machine-to-machine communication
        - Flow normally allows for storing of secret in *Client Application* allowing for direct connection to the *Resource Server*
    - authorizationUrl: *Authorization Server*
    - tokenUrl: *Resource Server*
    - refreshUrl: Optional field that can be used to refresh *Access Token*
    - scopes: The *User* data that the *Client Application* is requesting access to
    
    Example:
    ```
      securitySchemes:
      my_oAuth_security_schema:
        type: oauth2
        flows:
          implicit:
            authorizationUrl: https://api.example.com/oauth2/authorize
            scopes:
              read_acces: read data
              write_access: modify data
    ```
  - [OpenId Connect](https://swagger.io/docs/specification/authentication/openid-connect-discovery/): An identitiy layer built on top of the oAuth 2 flow:
    - "openIdConnectUrl"
      - Discovery endpoint at ".well-known/openid-configuration" that describes the configuration of the oAuth flow
   - Response includes an ID Token that includes some personal information about the user.

