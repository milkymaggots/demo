



drmsudo() { sudo docker stop $(sudo docker ps -a -q); sudo docker rm $(sudo docker ps -a -q); }


# sudo
# 


# Pswd
GL_CNTR=gitlab # demo-web-1
sudo docker exec -it $GL_CNTR grep 'Password:' /etc/gitlab/initial_root_password # OjzvfG44jYTv4aLO1m4A1xISeoNb4OrdvQ2JJkZYe6s=

# Network

sus systemctl restart systemd-resolved
# - mask
sudo systemctl mask systemd-resolved

# GL Runner
# gitlab-runner (cli)

# Runner

# - register
gitlab-runner register \
  --url http://localhost:8080 \
  --token glrt-kcGyuAoNsajnf4szz5bY

# - run
gitlab-runner run

# - config view
cat .gitlab-runner/config.toml


# Git
# - clone
ssh-agent bash -c 'ssh-add ~/.ssh/max_from_jimmy; git clone -b s4e-19/run-be-locally git@gitlab.com:jimmy-group1/s4e-be.git'
# - push
ssh-agent bash -c 'ssh-add ~/.ssh/max_from_jimmy; git push origin main';
# - remote set
# git remote set-url origin git@gitlab.com:jimmy-group1/s4e.git

# Docker
RUN_DOCKER() {
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
}