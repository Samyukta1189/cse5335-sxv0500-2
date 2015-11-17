#!/usr/bin/env ruby

require 'csv'
require 'redis'
require 'json'

begin 
    redisConn = Redis.new(:url => "redis://h:pbk0q15cl43kv87r17chtkab4ta@ec2-54-83-59-218.compute-1.amazonaws.com:10389")
    #redisConn = Redis.connect :url => ENV["redis://h:pbf731iss2eu3jaoojajbagnfs7@ec2-54-83-9-36.compute-1.amazonaws.com:18119"] 
    puts 'connected...'    
    puts "Enter the Key value (UNITID)"
    primary_key=gets
    if primary_key.strip! == nil
    query=redisConn.get(primary_key)
    else
    query=redisConn.get(primary_key)
    end
    if unless query.nil? or query == 0  
	 puts "Retrieve success"   
 	 puts "the retrieved data for UNITID key :"+primary_key
	 puts " OPEID | opeid6 | INSTNM | CITY | STABBR | INSTURL | NPCURL | LOCALE"
   	 val=JSON.parse(query)
	 if unless val.nil? or query == 0  
   	     puts "#{val[0]} | #{val[1]} | #{val[2]} | #{val[3]} | #{val[4]} | #{val[5]} | #{val[6]} | #{val[7]}"	     
         end
         end
    end
    end    
    redisConn.quit
    puts "Connection closed"
end

