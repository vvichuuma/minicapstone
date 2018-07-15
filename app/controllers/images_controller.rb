class ImagesController < ApplicationController



def index

  @image = Image.all 


  render "image.json.jbuilder"

end


def create
  
  @image = Image.new(

    url: params["url"],
    product_id:params["product_id"]

    )

 @image.save


render "show_images.json.jbuilder"

end









end
