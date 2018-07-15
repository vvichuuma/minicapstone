json.array! @products.each do |product|

  json.id product.id
  json.name product.name
  json.price product.price
  json.description product.description
  json.supplier_id product.supplier_id
  json.supplier product.supplier
  json.List_of_Images product.images
  json.categories product.category_product
  
end

  # json.partial! "products.json.jbuilder",product: p 


 # end