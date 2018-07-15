class OrdersController < ApplicationController

  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render "order_index.json.jbuilder"
  end

  def create
    @status = CartedProduct.where(user_id: current_user.id)
    @formal = @status.select{|state| state.status == "Carted"}
    #    product = Product.find_by(id:params[:product_id])
    #    quantity = params[:quantity].to_i
    # cal_subtotal = product.price * quantity
    #    cal_tax = product.tax * quantity
    #    cal_total = product.total * quantity
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

    @order = Order.new({

      user_id: current_user.id,
      subtotal: @sub_tot ,
      tax: @tax,
      total: @total


    })   


    if @order.save

         @formal.each do |carted_product|
         carted_product.status = "Purchased"
         carted_product.order_id = @order.id
         carted_product.save
    end
       
        


    end



    render "order_show.json.jbuilder"

  end


  def destroy

    @order = Order.find_by(id:params[:id])

    @order.destroy

    render json:{message:"The order has been removed"}

  end
end
