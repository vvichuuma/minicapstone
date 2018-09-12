# json.specific_product @product
# json.Tax @product.tax

# json.isproduct @product.is_discounted 

#json.total @product.total


  json.partial! "partial.json.jbuilder",product: @product

