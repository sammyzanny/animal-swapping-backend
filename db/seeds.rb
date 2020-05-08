 accessories = JSON.parse(File.read('./data/animal_crossing_clothing_accessories_items.json'))
 generic_accessories = JSON.parse(File.read('./data/animal_crossing_clothing_accessories_names.json'))
 bags = JSON.parse(File.read('./data/animal_crossing_clothing_bags_items.json'))
 generic_bags = JSON.parse(File.read('./data/animal_crossing_clothing_bags_names.json'))
 bottoms = JSON.parse(File.read('./data/animal_crossing_clothing_bottoms_items.json'))
 generic_bottoms = JSON.parse(File.read('./data/animal_crossing_clothing_bottoms_names.json'))
 dresses = JSON.parse(File.read('./data/animal_crossing_clothing_dresses_items.json'))
 generic_dresses = JSON.parse(File.read('./data/animal_crossing_clothing_dresses_names.json'))
 headwear = JSON.parse(File.read('./data/animal_crossing_clothing_headwear_items.json'))
 generic_headwear = JSON.parse(File.read('./data/animal_crossing_clothing_headwear_names.json'))
 shoes = JSON.parse(File.read('./data/animal_crossing_clothing_shoes_items.json'))
 generic_shoes = JSON.parse(File.read('./data/animal_crossing_clothing_shoes_names.json'))
 socks= JSON.parse(File.read('./data/animal_crossing_clothing_socks_items.json'))
 generic_socks= JSON.parse(File.read('./data/animal_crossing_clothing_socks_names.json'))
 tops = JSON.parse(File.read('./data/animal_crossing_clothing_tops_items.json'))
 generic_tops = JSON.parse(File.read('./data/animal_crossing_clothing_tops_names.json'))
 umbrellas = JSON.parse(File.read('./data/animal_crossing_clothing_umbrellas_names.json'))
 floors = JSON.parse(File.read('./data/animal_crossing_floor_items.json'))
 generic_floors = JSON.parse(File.read('./data/animal_crossing_floor_names.json'))
 generics = JSON.parse(File.read('./data/animal_crossing_generics.json'))
 houseware = JSON.parse(File.read('./data/animal_crossing_houseware_items.json'))
 generic_houseware = JSON.parse(File.read('./data/animal_crossing_houseware_names.json'))
 materials = JSON.parse(File.read('./data/animal_crossing_materials_items.json'))
 generic_materials = JSON.parse(File.read('./data/animal_crossing_materials_names.json'))
 miscellaneous = JSON.parse(File.read('./data/animal_crossing_miscellaneous_items.json'))
 generic_miscellaneous = JSON.parse(File.read('./data/animal_crossing_miscellaneous_names.json'))
 rug = JSON.parse(File.read('./data/animal_crossing_rug_items.json'))
 generic_rug = JSON.parse(File.read('./data/animal_crossing_rug_names.json'))
 wallmounted = JSON.parse(File.read('./data/animal_crossing_wallmounted_items.json'))
 generic_wallmounted = JSON.parse(File.read('./data/animal_crossing_wallmounted_names.json'))
 wallpaper = JSON.parse(File.read('./data/animal_crossing_wallpaper_items.json'))
 generic_wallpaper = JSON.parse(File.read('./data/animal_crossing_wallpaper_names.json'))

Wish.destroy_all
Sale.destroy_all
Item.destroy_all




accessories.each do |k,v|
    Item.create(name: k, img: v, category: "Clothing Accessories")
end

bags.each do |k,v|
   Item.create(name: k, img: v, category: "Clothing Bags")
end

bottoms.each do |k,v|
   Item.create(name: k, img: v, category: "Clothing Bottoms")
end

dresses.each do |k,v|
    Item.create(name: k, img: v, category: "Clothing Dresses")
end

headwear.each do |k,v|
   Item.create(name: k, img: v, category: "Clothing Headwear")
end

shoes.each do |k,v|
   Item.create(name: k, img: v, category: "Clothing Shoes")
end

socks.each do |k,v|
   Item.create(name: k, img: v, category: "Clothing Socks")
end

tops.each do |k,v|
  Item.create(name: k, img: v, category: "Clothing Tops")
end

floors.each do |k,v|
    Item.create(name: k, img: v, category: "Floors")
end

houseware.each do |k,v|
   Item.create(name: k, img: v, category: "Houseware")
end

materials.each do |k,v|
   Item.create(name: k, img: v, category: "Crafting Materials")
end

miscellaneous.each do |k,v|
   Item.create(name: k, img: v, category: "Miscellaneous")
end

rug.each do |k,v|
  Item.create(name: k, img: v, category: "Rug")
end

wallmounted.each do |k,v|
  Item.create(name: k, img: v, category: "Wall-Mounted")
end

wallpaper.each do |k,v|
    Item.create(name: k, img: v, category: "Wallpaper")
end

generic_accessories.each do |v|
    Item.create(name: v, img: generics["Clothing"], category: "Clothing Accessories")
end

generic_bags.each do |v|
    Item.create(name: v, img: generics["Clothing"], category: "Clothing Bags")
end

generic_bottoms.each do |v|
    Item.create(name: v, img: generics["Clothing"], category: "Clothing Bottoms")
end

generic_dresses.each do |v|
    Item.create(name: v, img: generics["Clothing"], category: "Clothing Dresses")
end

generic_headwear.each do |v|
    Item.create(name: v, img: generics["Clothing"], category: "Clothing Headwear")
end

generic_shoes.each do |v|
    Item.create(name: v, img: generics["Clothing"], category: "Clothing Shoes")
end

generic_socks.each do |v|
    Item.create(name: v, img: generics["Clothing"], category: "Clothing Socks")
end

generic_tops.each do |v|
    Item.create(name: v, img: generics["Clothing"], category: "Clothing Tops")
end

umbrellas.each do |v|
    Item.create(name: v, img: generics["Clothing"], category: "Clothing Umbrellas")
end

generic_floors.each do |v|
    Item.create(name: v, img: generics["Furniture"], category: "Floors")
end

generic_houseware.each do |v|
    Item.create(name: v, img: generics["Furniture"], category: "Houseware")
end

generic_materials.each do |v|
    Item.create(name: v, img: generics["Materials"], category: "Materials")
end

generic_miscellaneous.each do |v|
    Item.create(name: v, img: generics["Furniture"], category: "Miscellaneous")
end

generic_rug.each do |v|
    Item.create(name: v, img: generics["Furniture"], category: "Rug")
end

generic_wallmounted.each do |v|
    Item.create(name: v, img: generics["Furniture"], category: "Wall-Mounted")
end

generic_wallpaper.each do |v|
    Item.create(name: v, img: generics["Furniture"], category: "Wallpaper")
end