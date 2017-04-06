#!/bin/bash
# Program:
#	Reinstall R, RStudio Server and Shiny Server
# History:
# 20170315 leongkaon 0.1.0
# Future hope:
# 1.automatically install JDBC then install rJava
# 2.install MySQL
# 3.insert usb, then auto run
echo 'Hello World!\n'
echo 'This script is created by Leong Ka On,\n
it will install R, RStudio Server and Shiny Server.\n
Please contact https://github.com/leongkaon\n 
if there is any issue.\n'

read -p "Ready? (Y/N): " yn

#Install R
sudo apt-get update
sudo apt-get -y install build-essential libssl-dev libxml2-dev libcurl4-gnutls-dev libexpat1-dev
sudo apt-get -y install git git-core git-doc git-email gitweb git-gui gitk git-svn

sudo apt-get -y install r-base r-base-dev
sudo apt-get -y install gdebi-core

#Install Package
#devtools
sudo su - -c "R -e \"install.packages('devtools', repos='http://cran.rstudio.com/')\""

#Shiny & Shiny Server
sudo su - -c "R -e \"install.packages('shiny', repos = 'http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('shinydashboard', repos = 'http://cran.rstudio.com/')\""

wget https://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.5.3.838-amd64.deb
sudo gdebi shiny-server-1.5.3.838-amd64.deb

#Rmarkdown
sudo su - -c "R -e \"install.packages('knitr', repos = 'http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('rmarkdown', repos = 'http://cran.rstudio.com/')\""

#dplyr&graphs
sudo su - -c "R -e \"install.packages('dplyr', repos = 'http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('RColorBrewer', repos = 'http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('ggplot2', repos = 'http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('ggrepel', repos = 'http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('dygraphs', repos = 'http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('ggExtra', repos = 'http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('gridExtra', repos = 'http://cran.rstudio.com/')\""

#Machine Learning
sudo su - -c "R -e \"install.packages('rpart.plot', repos = 'http://cran.rstudio.com/')\""

#Step5--Installing R Packages from GitHub
sudo su - -c "R -e \"devtools::install_github('daattali/shinyjs')\""
sudo su - -c "R -e \"devtools::install_github('cran/highcharter')\""

#Install RStudio version 1.0.136
wget https://download2.rstudio.org/rstudio-server-1.0.136-amd64.deb
sudo gdebi rstudio-server-1.0.136-amd64.deb
rm rstudio-1.0.136-amd64.deb
























exit 0

