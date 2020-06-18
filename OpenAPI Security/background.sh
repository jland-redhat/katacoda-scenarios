JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/ 
export JAVA_HOME 

docker pull quay.io/keycloak/keycloak
docker run -d -p 8081:8080 -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin -e DB_VENDOR=H2  quay.io/keycloak/keycloak


clear
