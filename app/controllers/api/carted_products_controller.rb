class Api::CartedProductsController < ApplicationController

  
  def index
    
     @status = CartedProduct.where(user_id: current_user.id)
  

     @order = Order.where(user_id: current_user.id )
    

     render "index.json.jbuilder"

  end


  def create
   
   product = Product.find_by(id:params[:product_id])
   quantity = params[:quantity].to_i
   cal_subtotal = product.price * quantity
   cal_tax = product.tax * quantity
   @cal_total = product.total * quantity
   if @cal_total > 0
     @status = "Carted"
   elsif @cal_total <= 0 
     @status = "Cannot be Processed"
   end  

   @cartedproduct = CartedProduct.new(
     
       user_id: current_user.id,
       product_id: params[:product_id],
       quantity: params[:quantity],
       status: @status
       
    )     

   @cartedproduct.save 

   

   render "show.json.jbuilder"

  end




def destroy
  

   @cartedproduct = CartedProduct.find_by(id:params[:id])
   @cartedproduct.status = "Removed"
   @cartedproduct.save

   render json:{message:"The Product has been removed"}


end


end
