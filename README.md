# CAWeb Development  

[CAWebPublishing](https://caweb.cdt.ca.gov/) utilizes [Docker](https://www.docker.com/) for the development of the CAWeb WordPress Theme. This [Docker Compose](https://docs.docker.com/compose/) file allows for the rapid deployment of an environment with a MariaDB, phpMyAdmin, and a CAWebPublishing configured WordPress instance.  

#### Requirements  
- [Docker](https://www.docker.com/)  
- [ElegantThemes](https://www.elegantthemes.com/) Account Information (required to install Divi)

## To Get Started  
1. Clone this project.  
2. Edit the env/divi/divi.env file and add your ElegantThemes values in the appropriate fields. For help visit our wiki section, [Divi Environment Variables](https://github.com/CAWebPublishing/CAWeb-Development/wiki/Divi).  
2. Open a terminal in the root directory of this project.  
3. If you have [Make](http://gnuwin32.sourceforge.net/packages/make.htm) installed, you can run `make wplaunch`. Alternatively, you can run `docker-compose up -d`.  
   _Site creation may take several minutes, containers can be viewed by running_ `docker container ls` _from a terminal._  

## Project Breakdown  
**env/** - Directory with all environment variable files used by this project. For more information please visit our [Wiki](https://github.com/CAWebPublishing/CAWeb-Development/wiki).   
**wordpress/** - Directory with different files utilized by the this project. For more information please visit our [Wiki](https://github.com/CAWebPublishing/CAWeb-Development/wiki).  
**-docker-compose.yml** - YAML file configuring the 3 services.  
- mariadb - Database Service, utilizes the [Official MariaDB Docker Image](https://hub.docker.com/_/mariadb)  
![mariadb](https://raw.githubusercontent.com/wiki/CAWebPublishing/CAWeb-Development/imgs/mariadb-service.png)  
- phpMyAdmin - Administration tool for the database, utilizes the [Official phpMyAdmin Docker Image](https://hub.docker.com/r/phpmyadmin/phpmyadmin)  
![phpmyadmin](https://raw.githubusercontent.com/wiki/CAWebPublishing/CAWeb-Development/imgs/phpmyadmin-service.png)  
- site - CAWeb WordPress Instance, utilizes the [Official CAWebPublishing CAWeb Docker Image](https://hub.docker.com/repository/docker/cawebpublishing/caweb). For more information please visit our [Wiki](https://github.com/CAWebPublishing/CAWeb-Development/wiki).     
![site](https://raw.githubusercontent.com/wiki/CAWebPublishing/CAWeb-Development/imgs/site-service.png)  
