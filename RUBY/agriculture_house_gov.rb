require 'nokogiri'
require 'open-uri'
require 'date'
require './DateEX.rb'
require './StringEX.rb'

#
#
#
class AgricultureParser

    #
    #
    #
    def self.Parse( id )

        result = nil;

        url = "https://agriculture.house.gov/news/documentsingle.aspx?DocumentID=#{id}";

        doc = open( url );

        document = Nokogiri::HTML.parse( doc )

        title_node = document.css('.newsie-titler');
        body_node = document.css('.bodycopy').css("p")
        topnews_node = document.css('.topnewstext').css("b")
        
        str = StringEX.Normalize( topnews_node.text )
        tokens = StringEX.SmartSplit( str, 2, ",", true ) # {location}, {string date}

        data_date = ParseDate( tokens[1] )

        if( data_date != nil )    
            result = { title: title_node.text, 
                       date: data_date,
                       location: tokens[0],
                       article: data_body = body_node.text };
        end

        return result;
    end

    #
    # AGRICULTURE string to Date
    # Return: if error nil
    #
    def self.ParseDate( str )
   
        tokens = str.match(/^([a-zA-Z]+)\s(\d{1,2}),\s(\d{4})/)
   
        result = nil;

        if( tokens.length == 4 )
            begin
                month = DateEX.StrMonthToNum( tokens[1] );
                day = tokens[2].to_i
                year = tokens[3].to_i   

                result = Date.new( year, month, day )

            rescue Exception => e 
                puts "!!! ERROR !!!"
                puts "MSG: '#{e.message}'"
                puts "--------------------------"
            end        
        end

        return result;

    end

    #
    #
    #
end
