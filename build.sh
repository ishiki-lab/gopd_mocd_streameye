sudo docker build -t gopd-mocd-streameye .
sudo docker images
sudo docker tag gopd-mocd-streameye arupiot/gopd-mocd-streameye:latest
sudo docker push arupiot/gopd-mocd-streameye
