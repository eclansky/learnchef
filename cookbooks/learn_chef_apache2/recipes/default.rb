#
# Cookbook Name:: learn_chef_apache2
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

apt_update 'Update the apt cache daily' do
  frequency 86_400
  action :periodic
end

package 'apache2'

service 'apache2' do
  supports :status => true # Verifiy that its running with supports...
  action [:enable, :start]
end

#cal:wql template resource to create the homepage
template '/var/www/html/index.html' do
  source 'index.html.erb'
end
