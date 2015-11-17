#!/usr/bin/env ruby

require 'csv'
require 'uri'
require 'pg'


uri = URI.parse('postgres://mhxyyvzzhxvcuv:0IAK3e1e-PAvCzVwnJQKaEAiv7@ec2-54-83-53-120.compute-1.amazonaws.com:5432/df12vl33te4c9u')

begin 
    connection = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)    
    puts 'connected...'
    puts "Enter the primary Key value (UNITID)"
    primary_key=gets
    query_result= connection.exec("SELECT * from university where UNITID='"+primary_key+"';");
    if unless query_result.nil? or query_result == 0
	    puts "The key results are :\n"
    	    puts "UNITID | OPEID | opeid6 | INSTNM | CITY | STABBR | INSTURL | NPCURL | LOCALE"
	    query_result.each{
		unitID=query_result[0]['unitid']
		opeID=query_result[0]['opeid']
		opeid6=query_result[0]['opeid6']
		insTNM=query_result[0]['instnm']
		city=query_result[0]['city']
		state=query_result[0]['stabbr']
		instURL=query_result[0]['insturl']	
		otherurl=query_result[0]['npcurl']
		locale=query_result[0]['locale']
 		puts "#{unitID} | #{opeID} | #{opeid6} | #{insTNM} | #{city} | #{state} | #{instURL} | #{npcurl} | #{locale}"
	    }
	    end
    end   
    connection.close
    puts 'Connection closed'
end


	
