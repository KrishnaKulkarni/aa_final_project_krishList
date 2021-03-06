class SubcatsController < ApplicationController
  # Category Model
  # Subcat Model
  # assoc: Category has_many subcats
  def index
    @categories = Category.includes(:subcats).all
    render :index
  end
  
  def options
   @subcat_options = Subcat.find(params[:subcat_id]).combined_option_classes
    render :options, layout: false
  end

end
