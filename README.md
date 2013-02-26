bigdatabase
===========
create a virtual machine with:

Ubuntu 12.10

Download the install Skipts:

wget http://github.com/dreckbolle/bigdataset/tarball/master -O postgis-setup.tar.gz
tar xvf postgis-setup.tar.gz
rm postgis-setup.tar.gz
mv postgis-setup* postgis-setup
cd postgis-setup

wget https://github.com/dreckbolle/bigdatabase/blob/master/installapachephp.sh
sudo sh installapachephp.sh

wget http://github.com/dreckbolle/bigdatabase/installpostgis.sh
sudo sh installpostgis.sh
