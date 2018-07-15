

# json.id @order.id
# json.user_id @order.user_id
# json.subtotal @order.subtotal
# json.tax @order.tax
# json.total @order.total


# json.Products @formal.each do |indi|

#  json.product_id indi.product_id
#  json.quantity indi.quantity
#  @product = Product.find_by(id:indi.product_id)
#  @price = @product.price
#  @tax = @price * 0.09
#  @total = @price + @tax

#   quantity = indi.quantity.to_i
#   cal_subtotal = @price * quantity
#   cal_tax = @tax * quantity
#   cal_total = @total * quantity


# json.subtotal = cal_subtotal
# json.tax = cal_tax
# json.total = cal_total


# end

# json.Products @formal.each do |indi|

#  json.product_id indi.product_id
#  json.quantity indi.quantity
#  json.List_of_products @product = Product.find_by(id:indi.product_id)
#  @quantity = indi.quantity
#  json.price @price = @product.price
#  json.subtotal @subtotal = @price * @quantity
#  json.tax @tax = @price * 0.09
#  json.total @total = @price + @tax


# end

@num = 0
@sub_tot = 0

@formal.length.times do 

   @product = Product.find_by(id: @formal[@num].product_id)
  @price = @product.price
  @quantity = @formal[@num].quantity
  @sub_total_one = @price * @quantity
   

  @sub_tot = @sub_tot + @sub_total_one

  @num = @num + 1

end  


 @tax = @sub_tot * 0.09 
 @total = @sub_tot + @tax



     # json.id @order.id 
     # json.user_id @order.user_id
     # json.subtotal @order.subtotal
     # json.tax @order.tax 
     # json.total @order.total


json.list @order
 




   #@prod = Product.find_by(id: @formal[num].product_id).price
   
