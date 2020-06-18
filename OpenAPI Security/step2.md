## Security Requirements Intro

In the OpenAPI spec security requirements described by the "security" are how we connect one or multiple of our security scheme to either specific endpoint or the entire applicaiton. If security schemes are the "how", then security requirements are the "where".

To apply our security reqiurements to all of our endpoints at a global level then we would just add the `security` tag at the application level as follows:
  ```yaml
  security:
    -
      my_oAuth_security_schema:
        - read
        - write
  ```
