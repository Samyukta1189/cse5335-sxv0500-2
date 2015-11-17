#!/usr/bin/env ruby

require 'csv'
require 'uri'
require 'pg'


uri = URI.parse('postgres://mhxyyvzzhxvcuv:0IAK3e1e-PAvCzVwnJQKaEAiv7@ec2-54-83-53-120.compute-1.amazonaws.com:5432/df12vl33te4c9u')

begin 
    connection = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)    
    puts 'connected'
    #query= connection.exec("\\copy univs FROM '/home/yogambo/university.csv' DELIMITER ',' CSV HEADER;");
    CSV.foreach('univ_sampledb.csv', :headers => true) do |csv_obj|
       connection.exec("INSERT into university (UNITID, OPEID, opeid6, INSTNM, CITY,STABBR,INSTURL,NPCURL,LOCALE) VALUES ('"+csv_obj['UNITID']+"','"+csv_obj['OPEID']+"','"+csv_obj['opeid6']+"','"+csv_obj['INSTNM']+"','"+csv_obj['CITY']+"','"+csv_obj['STABBR']+"','"+csv_obj['INSTURL']+"','"+csv_obj['NPCURL']+"','"+csv_obj['LOCALE']+"');");
    end 
    puts "completed insertion sucessfully"
    connection.close
end



