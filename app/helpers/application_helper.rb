module ApplicationHelper
    def number_to_indian_currency(number, html=true)
        txt = "\u20B9"
        "#{txt} #{number.to_s.gsub(/(\d+?)(?=(\d\d)+(\d)(?!\d))(\.\d+)?/, "\\1,")}"
    end 
        
end
