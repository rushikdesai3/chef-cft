#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "httpd" do
	action  :install
end

service "httpd" do
	action [:enable, :start]
end

package "php" do
	action :install
end

package "php-mysql" do
	action :install
end

remote_file "#{Chef::Config[:file_cache_path]}/mysql-community-release-el7-5.noarch.rpm" do
      source 'http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm'
        action :create
end

rpm_package 'mysql-community-release' do
      source "#{Chef::Config[:file_cache_path]}/mysql-community-release-el7-5.noarch.rpm"
        action :install
end

package "mysql-community-server" do
	action :install
end

service "mysqld" do
	action [:enable, :start]
end

