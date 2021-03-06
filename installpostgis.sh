#!/bin/bash
# a plain 12.10 Ubuntun Linux Installation is needed to run this script
# for reference: http://trac.osgeo.org/postgis/wiki/UsersWikiPostGIS20Ubuntu1210src

#be up to date
sudo apt-get update
sudo apt-get upgrade

#download needed packages
sudo apt-get -y  install build-essential postgresql-9.1 postgresql-server-dev-9.1 libgeos-c1 libxml2-dev libproj-dev libjson0-dev xsltproc docbook-xsl docbook-mathml
sudo apt-get -y install libgdal1-dev

#download postgis 2
wget http://download.osgeo.org/postgis/source/postgis-2.0.2.tar.gz
tar xfvz postgis-2.0.2.tar.gz
cd postgis-2.0.2
./configure
make
sudo make install
sudo ldconfig
sudo make comments-install
sudo ln -sf /usr/share/postgresql-common/pg_wrapper /usr/local/bin/shp2pgsql
sudo ln -sf /usr/share/postgresql-common/pg_wrapper /usr/local/bin/pgsql2shp
sudo ln -sf /usr/share/postgresql-common/pg_wrapper /usr/local/bin/raster2pgsql

#pgadmin3 installieren:
sudo apt-get -y install pgadmin3

#Passwort des Postgres User ändern:
#sudo -u postgres psql
#\password postgres
#\q

#Spatially enabling a database using extensions is a new feature of PostgreSQL 9.1.
#Connect to your database using pgAdmin or psql, and run the following commands. To add postgis with raster support:
#CREATE EXTENSION postgis;
#CREATE EXTENSION postgis_topology;

#postgis template
sudo -u postgres createdb template_postgis
sudo -u postgres psql -d template_postgis -c "UPDATE pg_database SET datistemplate=true WHERE datname='template_postgis'"
sudo -u postgres psql -d template_postgis -f /usr/share/postgresql/9.1/contrib/postgis-2.0/postgis.sql
sudo -u postgres psql -d template_postgis -f /usr/share/postgresql/9.1/contrib/postgis-2.0/spatial_ref_sys.sql
sudo -u postgres psql -d template_postgis -f /usr/share/postgresql/9.1/contrib/postgis-2.0/postgis_comments.sql

#raster
sudo -u postgres psql -d template_postgis -f /usr/share/postgresql/9.1/contrib/postgis-2.0/rtpostgis.sql
sudo -u postgres psql -d template_postgis -f /usr/share/postgresql/9.1/contrib/postgis-2.0/raster_comments.sql

#topology
sudo -u postgres psql -d template_postgis -f /usr/share/postgresql/9.1/contrib/postgis-2.0/topology.sql
sudo -u postgres psql -d template_postgis -f /usr/share/postgresql/9.1/contrib/postgis-2.0/topology_comments.sql

