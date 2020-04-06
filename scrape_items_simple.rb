require 'open-uri'
require 'nokogiri'
require 'json'

url = 'https://animalcrossing.fandom.com/wiki/Crafting_materials_(New_Horizons)'
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
    
        
        if col2.search('img').empty? && col1.search('a').any?
            nameOnly.push(col1.search('a')[0].text)
        elsif col2.search('img').empty?
            nameOnly.push(col1.text)
        elsif col2.search('img').any?
            items[col1.search('a')[0].text] = col2.search('img')[0]['data-src']
        end
    end
        
        
    
end

# tabber.search('img').each do |img| 
#     images.push(img.src)
# end
items.each{|k,v| item[k.chomp] = v}

nameOnly.map!{|name| name.chomp}



jsoname = JSON.pretty_generate(nameOnly)
File.open("animal_crossing_materials_names.json", 'w') { |file| file.write(jsoname) }
 

json = JSON.pretty_generate(item)
File.open("animal_crossing_materials_items.json", 'w') { |file| file.write(json) }