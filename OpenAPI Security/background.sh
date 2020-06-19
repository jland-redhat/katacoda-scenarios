JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/ 
export JAVA_HOME 



docker run -d -p 8081:8080 -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin -e DB_VENDOR=H2  jboss/keycloak


clear
