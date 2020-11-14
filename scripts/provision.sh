#!/usr/bin/env bash

apt update
# install git ruby ruby-dev
which git ruby ruby-dev &>/dev/null || {
  apt-get install -y git ruby ruby-dev
}

su - vagrant
cd /vagrant
sudo gem install bundler
bundle install
# sinatra will block vagrant port-forwarding unless explicitly binded to 0.0.0.0 below
# daemonize sinatra app so provisioning exits
nohup ruby /vagrant/sinatra.rb -o 0.0.0.0 0<&- &>/dev/null &
echo "http://$(hostname -I|cut -f2 -d ' '):4567"
