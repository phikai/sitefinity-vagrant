Vagrantfile for testing Sitefinity on Windows
=============================

**_This project is currently broken. Provisioning completes, but portions of code to automate Sitefinity installation and permissions have not been completed. Contributions welcome._**

##Credits
Heavily inspired by [Kevin Wilson](http://kwilson.me.uk/blog/provisioning-a-windows-server-vagrant-box-with-iis-net-4-5-and-octopus-deploy/) and [Dmitry Zaets' Windows VagrantFile](https://github.com/dmitry-zaets/vagrantfile-windows-iis-mssql)

This repository contains a Windows box ([Windows 2008 R2 x64 with Service Pack 1](https://vagrantcloud.com/ferventcoder/boxes/win2008r2-x64-nocm)) and a configured installation of Sitefinity.

#How to use?
1. Clone repository by `git clone`
1. Download ([.NET Framework](http://download.microsoft.com/download/E/2/1/E21644B5-2DF2-47C2-91BD-63C560427900/NDP452-KB2901907-x86-x64-AllOS-ENU.exe)) and ([MSSQL Server](http://download.microsoft.com/download/0/4/B/04BE03CD-EAF3-4797-9D8D-2E08E316C998/SQLEXPRWT_x64_ENU.exe)) and place them into folder of cloned repository
1. Run `vargant up` and wait will virtual machine is installed
1. Open http://192.168.100.10/ in a browser

##Vagrant file includes:
* IIS 7.5
* .NET 4.5.2
* MS SQL Server 2008 R2
