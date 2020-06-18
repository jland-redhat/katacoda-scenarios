podman pull quay.io/keycloak/keycloak
podman run -d -p 8081:8080 -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin -e DB_VENDOR=H2  quay.io/keycloak/keycloak
