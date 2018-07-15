

 #json.list_of_suppliers @supply

# json.list_of_Products supplier.product

json.array! @supply.each do |sup|
   json.id sup.id
   json.name sup.name
   json.email sup.email
   json.phone_number sup.phone_number
  json.List_of_products sup.products   
    


  end