export GITLAB_HOME=$HOME/gitlab

# Default
sudo docker run --detach \
  --hostname gitlab.example.com \
  --publish 443:443 --publish 80:80 --publish 22:22 \
  --name gitlab \
  --restart always \
  --volume $GITLAB_HOME/config:/etc/gitlab \
  --volume $GITLAB_HOME/logs:/var/log/gitlab \
  --volume $GITLAB_HOME/data:/var/opt/gitlab \
  --shm-size 256m \
  gitlab/gitlab-ee:latest


# # Own
# # --publish 443:443 --publish 80:80 --publish 22:22 \
# docker run --detach \
#   --hostname gitlab.example.com \
#   --publish 8080:80 \
#   --name gitlab \
#   --restart always \
#   --volume $GITLAB_HOME/config:/etc/gitlab \
#   --volume $GITLAB_HOME/logs:/var/log/gitlab \
#   --volume $GITLAB_HOME/data:/var/opt/gitlab \
#   --shm-size 1024m \
#   gitlab/gitlab-ee:latest

