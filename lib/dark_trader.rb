require 'open-uri'
require 'nokogiri'


    tab_symbol = []
    tab_curr = []
    tab_crypto = {}
    tab_crypto2 = []


    doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    doc.xpath('//*/td[3]').each do |symbol|  
      symbol.text
      tab_symbol << symbol.text
    end

    doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    doc.xpath('//*/td[5]/a').each do |curr|
      curr.text
      tab_curr << curr.text
    end
    
    i=0
    while i < tab_symbol.size 
      tab_crypto = {tab_symbol[i] => tab_curr[i]}
      i+=1
      tab_crypto2 << tab_crypto  
    end
      
puts tab_crypto2
