class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { in: 10..500 }



  def tax
    price * 0.09
  end


  def total
    price + tax
  end

  def discounted?
    price < 10
  end


  def category_product
    categories.map{|category| category.name}
  
  end

  has_many :orders
  has_many :images

  # def images 

  #   Image.where(product_id:self.id)

    

  # end

  has_many :category_products
  has_many :categories, through: :category_products
  belongs_to :supplier
  has_many :carted_products

  # def supplier
    
  #   @only_n = Supplier.find_by(id:self.supplier_id)



  #   @only_n.name



  # end


 # def total
 #  8 + 10
 # end
#   @product.tax + @product.price

# end


#Products belongs to suppliers


  #product has many images


# def supplier
#    @supply = Supplier.find_by(id:supplier_id)


#    return @supply.name
   
# end


# def images
  
#   @image = Image.where(product_id:id)


# end

end
