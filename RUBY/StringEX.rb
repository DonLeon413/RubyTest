#
#
#
class StringEX

    #
    # AGRICULTURE Normalize (prepare) string
    #
    def self.Normalize( str )
        result = str.gsub( "\r","" )
        result = result.gsub( "\n", "" )
        return result
    end

    #
    #
    #
    def self.SmartSplit( str, count = 0, separator = ",", trimAll = true )
    
        result = str.split( separator, count )
    
        if trimAll       
            result.map! { |item| item.strip }
        end
    
        return result;
    end    
    
end    