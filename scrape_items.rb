require 'open-uri'
require 'nokogiri'
require 'json'

url = 'https://animalcrossing.fandom.com/wiki/Clothing_(New_Horizons)'
html = open(url)
item = {}
items = {}
nameOnly = []
doc = Nokogiri::HTML(html)
tabber = doc.at('//*[@id="mw-content-text"]/table[2]')
tabber.search('tr').each do |tr| 
    
    if (tr.search('td').length > 2)
        col1 = tr.search('td')[0]
        col2 = tr.search('td')[1]
    
        if col1.search('a').any? && col1.search('a')[0].text.include?("px")
            nameOnly.push(col2.children[0].text)
        elsif col2.search('a').any? && col2.search('a')[0].text.include?("px")
            nameOnly.push(col1.children[0].text)
        elsif col1.search('img').any?
            items[col2.search('a').text] = col1.search('img')[0]['data-src']
        elsif col2.search('img').any?
            items[col1.text] = col2.search('img')[0]['data-src']
        end
    end
        
        
    
end

# tabber.search('img').each do |img| 
#     images.push(img.src)
# end
items.each{|k,v| item[k.chomp] = v}

# nameOnly.map!{|name| name.chomp}



 
  
# end
puts nameOnly
# json = JSON.pretty_generate(item)
# File.open("animal_crossing_clothing_items.json", 'w') { |file| file.write(json) }