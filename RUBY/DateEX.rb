
class DateEX

    def self.StrMonthToNum( str )
        months = [ "january", "february", "march",
                   "april", "may", "june", 
                   "july", "august", "september",
                   "october","november","december" ];
        
        content = str.downcase
    
        idx = months.index( content ); 
    
        # if idx == nil -> throw Exception
    
        return ( idx + 1 );
    end
end