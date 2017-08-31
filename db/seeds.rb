require 'CSV'

Product.destroy_all
Inventory.destroy_all

CSV.foreach("#{Rails.root}/products.csv",:col_sep => "|") do |row|
  Product.create!( id: row[0].to_i, name: row[1], image_url: row[2], description: row[3] )
end

CSV.foreach("#{Rails.root}/inventory.csv", :col_sep => "|") do |row|
  Inventory.create!( product_id: row[0].to_i, waist: row[1].to_i, length: row[2].to_i, style: row[3], count: row[4].to_i )
end

puts "seeding finished. #{Product.count} product rows, #{Inventory.count} inventory rows"

