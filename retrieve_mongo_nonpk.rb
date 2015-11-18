require 'mongo'
require 'csv'

mongo_uri = 'mongodb://heroku_zcv2fdx1:nbl7j60dsuekm0kgj8jl5sqqr9@ds055594.mongolab.com:55594/heroku_zcv2fdx1'

begin
    client = Mongo::Client.new([ 'ds055594.mongolab.com:55594' ],:database =>'heroku_zcv2fdx1',:user=>'heroku_zcv2fdx1',:password=>'nbl7j60dsuekm0kgj8jl5sqqr9');
    puts "Connected to Mongodb"
    puts "Enter any non primary Key value (CITY or INSTNM or STABBR)"
    column=gets.chomp
	puts "Enter the value for the non primary key"
    value=gets.chomp

	
	
    db = client.database

        coll_db=db.collection('university_mongo')
		result=coll_db.find({column => value})
		
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
	
    puts 'Connection closed'
end
