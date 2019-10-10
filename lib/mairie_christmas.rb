require 'rubygems'
require 'open-uri'
require 'nokogiri'

def get_townhall_email(townhall_url)
  doc = Nokogiri::HTML(open(townhall_url))
    doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |a|  
      a.text
      puts a.text
    end
end
#get_townhall_email("https://www.annuaire-des-mairies.com/95/avernes.html")

def get_townhall_urls(department_url)
  tab_url = []
  doc = Nokogiri::HTML(open(department_url))
    url = doc.xpath('//*[@class="lientxt"]/@href').map { |s| s.to_s.delete_prefix('.').prepend("https://www.annuaire-des-mairies.com")}
    tab_url << url
    puts tab_url
end
#get_townhall_urls("http://annuaire-des-mairies.com/val-d-oise.html")

def cities(city_name)
  tab_cities =[]
  doc = Nokogiri::HTML(open(city_name))
    doc.xpath('//*[@class="lientxt"]').each do |a|  
      tab_cities << a.text  
    end
    puts tab_cities
end

#cities("http://annuaire-des-mairies.com/val-d-oise.html")

def email_cities()
  tab_email_cities = []
  doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  doc.xpath('//*[@class="lientxt"]').each do |a|
    tab_email_cities << {"#{a.text}" => get_townhall_email(a.text.downcase.gsub(' ', '-'))}
    end
    puts tab_email_cities
end

email_cities