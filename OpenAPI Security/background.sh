JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/ 
export JAVA_HOME 


git clone https://github.com/jland-redhat/rhc_openapi_todo.git
cd rhc_openapi_todo
git checkout security


docker run -d -p 8443:8443 -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin -e DB_VENDOR=H2  jboss/keycloak


clear
