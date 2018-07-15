class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      flash.now[:notice] = "\"#{@item.name}\" was saved succesfully."
    else
      flash.now[:alert] = "Error creating item."
    end
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      flash.now[:notice] = "\"#{@item.name}\" was completed. Good job!"
    else
      flash.now[:alert] = "There was an error deleting the item"
    end
  end

  private
    def item_params
      params.require(:item).permit(:name)
    end
end
