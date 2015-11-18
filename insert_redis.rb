#!/usr/bin/env ruby

require 'csv'
require 'redis'
require 'json'



begin 
    redisConn = Redis.new(:url => "redis://h:pbk0q15cl43kv87r17chtkab4ta@ec2-54-83-59-218.compute-1.amazonaws.com:10389")
    #redisConn = Redis.connect :url => ENV["redis://h:pbf731iss2eu3jaoojajbagnfs7@ec2-54-83-9-36.compute-1.amazonaws.com:18119"] 
    puts 'connected to Redis...'
    CSV.foreach('univ_sampledb.csv', :headers => true) do |csv_obj|
       redisConn.set csv_obj['UNITID'],[csv_obj['OPEID'],csv_obj['opeid6'],csv_obj['INSTNM'],csv_obj['CITY'],csv_obj['STABBR'],csv_obj['INSTURL'],csv_obj['NPCURL'],csv_obj['LOCALE']].to_json
    end 
    redisConn.quit
    puts "completed insertion sucessfully"
    
end

