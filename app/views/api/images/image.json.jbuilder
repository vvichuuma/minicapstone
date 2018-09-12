

json.list_of_Images @image.each do |img|


  json.id img.id
  json.product_id img.product_id
  json.image_url img.url
 #json.products img.product
 json.products img.product
end