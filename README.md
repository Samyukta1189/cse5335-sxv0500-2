####cse5335-project-1
=====================
#####Name: Samyukta Vuyyuru
----------------------
#####UTA id: 1001110500
---------------------
#####website: https://cse5335-sxv0500.herokuapp.com/
--------------------------------------------------------

#####1.  External data source used to populate your Heroku database.

    The external data source that I have used for this project is from the external datasource http://www.data.gov/developers/apis. The sample data file used is a csv file from the College Scoreboard dataset. This csv file contains about 26000 records and therefore it has been tailored to contain 379 records with a primary key (UNITID) and other non-primary keys.

#####2. Heroku toolbelt commands to execute the scripts.

    * Github commands to create a github repository and clone it to the desktop.  
    1. create github repository cse5335-sxv0500-2  
    2. git clone https://github.com/Samyukta1189/cse5335-sxv0500-2
    * Heroku 
     heroku login
     Creating heroku server and datasource addons.
     heroku create cse-sxv0500-2
     heroku addons:create Heroku-postgres
     heroku addons:create Heroku-redis
     heroku addons:create Mongolabs
     heroku config
     
     * creating postgres database
     heroku pg:psql -app -cse-sxv0500-2 
     \connect df12vl33te4c9u
     create table university (UNITID integer, OPEID integer, opeid6 integer, INSTNM varchar(100), CITY varchar,STABBR varchar,INSTURL varchar,NPCURL varchar,LOCALE integer, primary key(UNITID));
     \q
     
     * Github commands to push to heroku server and Heroku toolbelt commands
     git add .
     git commit -m "Initial commit"
     git push heroku master
     
    *Postgress
    heroku run ruby insert_csv_pg.rb
    heroku run ruby retrieve_postgres.rb
    heroku run ruby retrieve_postgres_nonpk.rb
      
    *MongoDb
     heroku run ruby insert_mongo.rb
     heroku run ruby retrieve_mongo.rb
     heroku run ruby retrieve_mongo_nonpk.rb
     
     *Redis
      heroku run ruby insert_redis.rb
      heroku run ruby retrieve_redis.rb

#####3. Easy implementations

     The easy or simple implementation are:
     * Creating addons in the Heroku server.
     * Using MongoDb  to insert and retrieve dataset into and from the Heroku Mongolab. 
     * Selecting a datasource which satisfies all the requirements of having a primary and non-primary keys.

#####4. Hard implementations

    The difficult part of the implementation is:
    * Using the postgres database in Windows. Installation of Postgres 9.5 in Windows requires to add the 'psql' environment
    variables to the %PATH% variable.
    * When using json file to parse the csv attributes to json, a lot of data parse errors where reported which had to be    dentified and corrected before executions.
    * Working with json library files for non-primary key implementation.


