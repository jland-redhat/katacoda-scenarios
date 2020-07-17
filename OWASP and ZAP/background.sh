echo 'Installing ZAP...'
docker pull owasp/zap2docker-stable
docker run --rm -p 8080:8080 owasp/zap2docker-stable

echo 'Installing Juice Shop...'
docker pull bkimminich/juice-shop
docker run --rm -p 3000:3000 bkimminich/juice-shop