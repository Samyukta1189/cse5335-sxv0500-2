#!/usr/bin/env ruby

require 'csv'
require 'uri'
require 'pg'


uri = URI.parse('postgres://mhxyyvzzhxvcuv:0IAK3e1e-PAvCzVwnJQKaEAiv7@ec2-54-83-53-120.compute-1.amazonaws.com:5432/df12vl33te4c9u')

begin 
    connection = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)    
    puts 'connected to postgress...'
    puts "Enter any non primary Key value (CITY or INSTNM or STABBR)"
    column_name=gets.chomp
	puts "Enter the value for the non primary key"
    key_value=gets.chomp
   
    result= connection.exec("SELECT * from university where "+column_name+" ='"+key_value+"' limit 20;");
 
	    puts "The key results are :\n"
    	    puts "UNITID -- OPEID -- opeid6 -- INSTNM -- CITY -- STABBR -- INSTURL -- NPCURL -- LOCALE"
	    result.each do |temp|
		unitID=temp['unitid']
		opeID=temp['opeid']
		opeID6=temp['opeid6']
		instName=temp['instnm']
		city=temp['city']
		state=temp['stabbr']
		instURL=temp['insturl']	
		otherURL=temp['npcurl']
		locale=temp['locale']
 		puts "#{unitID} -- #{opeID} -- #{opeID6} -- #{instName} -- #{city} -- #{state} -- #{instURL} -- #{otherURL} -- #{locale}"
	    
	  end  
    
    connection.close
    puts 'Connection closed'
end