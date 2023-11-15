

# # # Jimmy
gpjimmy() {
  ssh-agent bash -c 'ssh-add ~/.ssh/max_from_jimmy; git push origin main';
	# git remote set-url origin git@gitlab.com:jimmy-group1/s4e.git
}

# clone
ssh-agent bash -c 'ssh-add ~/wp/demo/max_from_jimmy; git clone -b s4e-19/run-be-locally git@gitlab.com:jimmy-group1/s4e-be.git'

