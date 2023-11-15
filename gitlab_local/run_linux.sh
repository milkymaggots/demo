

drmsudo() { sudo docker stop $(sudo docker ps -a -q); sudo docker rm $(sudo docker ps -a -q); }


# sudo
# 
# sudo
# --publish 443:443 \
  # --publish 22:22 \
export GITLAB_HOME=~/gitlab
docker run --detach \
  --hostname gitlab.example.com \
  --publish 8080:80 \
  --name gitlab \
  --restart always \
  --volume $GITLAB_HOME/config:/etc/gitlab:Z \
  --volume $GITLAB_HOME/logs:/var/log/gitlab:Z \
  --volume $GITLAB_HOME/data:/var/opt/gitlab:Z \
  --shm-size 256m \
  gitlab/gitlab-ee:latest

# Pswd
# - root
docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password