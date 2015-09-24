# http://kwilson.me.uk/blog/provisioning-a-windows-server-vagrant-box-with-iis-net-4-5-and-octopus-deploy/
# https://github.com/dmitry-zaets/vagrantfile-windows-iis-mssql
# -*- mode: ruby -*-
# vi: set ft=ruby :
if ! File.exists?( File.join(File.dirname(__FILE__), 'resources/NDP452-KB2901907-x86-x64-AllOS-ENU.exe') )
  puts '.Net 4.5.2 installer could not be found!'
  puts "Please run:\n  wget http://download.microsoft.com/download/E/2/1/E21644B5-2DF2-47C2-91BD-63C560427900/NDP452-KB2901907-x86-x64-AllOS-ENU.exe"
  exit 1
end

if ! File.exists?( File.join(File.dirname(__FILE__), 'resources/SQLEXPRWT_x64_ENU.exe') )
  puts 'SQL Server 2014 Express could not be found!'
  puts "Please run:\n  wget http://download.microsoft.com/download/E/2/1/E21644B5-2DF2-47C2-91BD-63C560427900/NDP452-KB2901907-x86-x64-AllOS-ENU.exe"
  exit 1
end

if ! File.exists?( File.join(File.dirname(__FILE__), 'resources/SitefinityTrialSetup_2015.09.0.exe') )
  puts 'Sitefinity installer could not be found!'
  puts "Please run:\n  wget http://www.sitefinity.com/downloads/productfiles/bhehb/SitefinityTrialSetup_2015.09.0.exe"
  exit 1
end

Vagrant.configure(2) do |config|

  config.vm.box = "ferventcoder/win2008r2-x64-nocm"
  config.vm.guest = :windows
  config.vm.communicator = "winrm"

  config.vm.boot_timeout = 600

  config.vm.network "private_network", ip: "192.168.100.10"
  config.vm.network :forwarded_port, guest: 1025, host: 1025
  config.vm.network :forwarded_port, guest: 3389, host: 1234
  config.vm.network :forwarded_port, guest: 5985, host: 5985, id: "winrm", auto_correct: true

  # .NET 4.5
  config.vm.provision :shell, path: "scripts/install-dot-net.ps1"
  config.vm.provision :shell, path: "scripts/install-dot-net-45.cmd"

  # Database
  config.vm.provision :shell, path: "scripts/install-sql-server.cmd"
  config.vm.provision :shell, path: "scripts/configure-sql-server.ps1"

  # IIS
  config.vm.provision :shell, path: "scripts/install-iis.cmd"
  #config.vm.provision :shell, path: "scripts/delete-default-iis-website.ps1"

  # Sitefinity
  #config.vm.provision :shell, path: "scripts/install-sitefinity.ps1"
  #config.vm.provision :shell, path: "scripts/configure-sitefinity.ps1"

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    # vb.gui = true

    # Customize the amount of memory on the VM:
    vb.cpus = 2
    vb.memory = 2048
  end

end
