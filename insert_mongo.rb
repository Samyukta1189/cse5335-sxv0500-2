require 'mongo'
require 'csv'

mongo_uri = 'mongodb://heroku_zcv2fdx1:nbl7j60dsuekm0kgj8jl5sqqr9@ds055594.mongolab.com:55594/heroku_zcv2fdx1'

begin
    client = Mongo::Client.new([ 'ds055594.mongolab.com:55594' ],:database =>'heroku_zcv2fdx1',:user=>'heroku_zcv2fdx1',:password=>'nbl7j60dsuekm0kgj8jl5sqqr9');
    puts "connected"
    db = client.database
    db.collection_names.each{|name| puts name }
        coll_db=db.collection('university_mongo')
        
    CSV.foreach('univ_sampledb.csv', :headers => true) do |csv|
               result=coll_db.insert_one({ :unitid => csv['UNITID'], :opeid => csv['OPEID'], :opeid6 => csv['opeid6'], :instnm => csv['INSTNM'], :city => csv['CITY'], :stabbr => csv['STABBR'], :insturl => csv['INSTURL'], :otherurl => csv['NPCURL'], :locale => csv['LOCALE']})
                      
                
        end     
        puts "insertion done"

end