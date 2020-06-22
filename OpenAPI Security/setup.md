Setup Keycloak:

v1
```
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/ 
export JAVA_HOME 

cd /tmp
curl https://downloads.jboss.org/keycloak/7.0.0/keycloak-7.0.0.zip --output keycloak-7.0.0.zip
unzip keycloak-7.0.0.zip
cd keycloak-7.0.0/bin
./add-user-keycloak.sh -r master -u admin -p admin
./standalone.sh -b 0.0.0.0
```{{execute T2}}

Takes a while to setup up the keycloak environment, but you should be able to complete up to step 4 on terminal T1 and the VS code tab while you wait for this to complete.
