class SuppliersController < ApplicationController


def index 
  
   @supply = Supplier.all 

   render "index_supply.json.jbuilder"
 
end



def create

  @supply = Supplier.new(

   name: params[:name],
   email:params[:email],
   phone_number:params[:phone_number]

    )


  @supply.save


 render "show_supply.json.jbuilder"


end




def show
   
  @supply = Supplier.find_by(id:params[:id])


  render "show_supply.json.jbuilder"


end


def update


  @supply = Supplier.find_by(id:params[:id])

end


end
