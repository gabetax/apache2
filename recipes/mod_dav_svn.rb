#
# Cookbook Name:: apache2
# Recipe:: dav_svn 
#
# Copyright 2008-2009, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package "libapache2-svn" do
  case node['platform']
  when "centos","redhat","scientific","fedora","suse","amazon"
    package_name "mod_dav_svn"
  else
    package_name "libapache2-svn"
  end
end

apache_module "dav_svn"

# In Ubuntu 12.04 authz_svn was moved from dav_svn to its own module
if node[:platform] = 'ubuntu' && node[:platform_version].to_f >= 12.04
  apache_module "authz_svn"
end