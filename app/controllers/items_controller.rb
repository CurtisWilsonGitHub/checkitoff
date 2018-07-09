class ItemsController < ApplicationController

  def new
    @item = Item.new
  end
  
  def create
    @user = current_user
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      redirect_to current_user, notice: "Item was saved succesfully."
    else
      flash.now[:alert] = "Error creating item."
      render :new
    end
  end

  private
    def item_params
      params.require(:item).permit(:name, :user)
    end
end
