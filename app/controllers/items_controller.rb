class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      redirect_to current_user, notice: "Item was saved succesfully."
    else
      flash.now[:alert] = "Error creating item."
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "\"#{@item.name}\" was completed. Good job!"
      redirect_to user_path
    else
      flash.now[:alert] = "There was an error deleting the item"
      redirect_to :show
    end
  end

  private
    def item_params
      params.require(:item).permit(:name)
    end
end
