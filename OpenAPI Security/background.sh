JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/ 
export JAVA_HOME 


git clone https://github.com/jland-redhat/rhc_openapi_todo.git
cd rhc_openapi_todo
git checkout security


#docker run -d -p 8443:8443 -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin -e DB_VENDOR=H2  jboss/keycloak
cd /tmp
curl https://downloads.jboss.org/keycloak/7.0.0/keycloak-7.0.0.zip --output keycloak-7.0.0.zip
unzip keycloak-7.0.0.zip
cd keycloak-7.0.0/bin
./add-user-keycloak.sh -r master -u admin -p admin
./standalone.sh -b 0.0.0.0 &

cd ~/rhc_openapi_todo

clear
