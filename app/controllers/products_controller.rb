class ProductsController < ApplicationController


before_action :authenticate_admin, except: [:index, :show]


 def index
   # @inn = params["id"]
   # @display = Product.find_by(id:"#{@inn}")
  #@products = Product.all

  @products = Product.all
  # @products = Product.where("name LIKE?","%outh%")
search_name = params["q"]


if search_name

  @products = @products.where("name LIKE ?", "%#{search_name}%")

 end

 
    @products = @products.order(:price)


  category_name = params[:category]

  if category_name
    @products = Category.find_by(name: category_name).products

  end






  render "index.json.jbuilder"

 end




 def create


     
     @name = params["name"]
     @price = params["price"]
   
     @des = params["des"]



    @product = Product.new(name:"#{@name}",price:"#{@price}",description:"#{@des}")
     #product.save
        if @product.save
          render "show.json.jbuilder"
        else
          render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
        end


   render "show.json.jbuilder"

 end

  def segment
   @inn = params["this_variable"]
   @display = Product.find_by(id:"#{@inn}")
  @pro = Product.all
  render "pro.json.jbuilder"

 end


  def show
     
     @id = params["id"]
    @product = Product.find_by(id:"#{@id}")

    render "show.json.jbuilder"

  end


  def update
   @id = params["id"]
    @product = Product.find_by(id:"#{@id}")   

   @product.name = params["name"] || @product.name


   @product.price = params["price"] || @product.price


   @product.description = params["desc"] || @product.description

   @product.save

      if @product.save
          render "show.json.jbuilder"
      else
          render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
      end


    render "show.json.jbuilder"
  
  end


 def acoustic
   @acous = Product.first

   render "acoustic.json.jbuilder"

 end


  def electric
   @elec = Product.second

   render "electric.json.jbuilder"

 end

 #Product.find_by(id: 4)


  def bass
   @bas = Product.last

   render "bass.json.jbuilder"

 end







end
