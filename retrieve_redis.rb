#!/usr/bin/env ruby

require 'csv'
require 'redis'
require 'json'

begin 
    redisConn = Redis.new(:url => "redis://h:pbk0q15cl43kv87r17chtkab4ta@ec2-54-83-59-218.compute-1.amazonaws.com:10389")
    #redisConn = Redis.connect :url => ENV["redis://h:pbf731iss2eu3jaoojajbagnfs7@ec2-54-83-9-36.compute-1.amazonaws.com:18119"] 
    puts 'connected to Redis...'    
    puts "Enter the primary key attributeue (UNITID)"
    key=gets
    if key.strip! == nil
    res_query=redisConn.get(key)
    else
    res_query=redisConn.get(key)
    end
     
	 puts "Retrieved successfully"   
 	 puts "the retrieved data for UNITID  :"+key+" is displayed below"
	 puts " OPEID -- opeid6 -- INSTNM -- CITY -- STABBR -- INSTURL -- NPCURL -- LOCALE"
   	 attribute=JSON.parse(query)
	 if unless attribute.nil? or res_query == 0  
   	     puts "#{attribute[0]} -- #{attribute[1]} -- #{attribute[2]} -- #{attribute[3]} -- #{attribute[4]} -- #{attribute[5]} -- #{attribute[6]} -- #{attribute[7]}"	     
         end
         
    end
     
    redisConn.quit
    puts "Connection closed"
end

