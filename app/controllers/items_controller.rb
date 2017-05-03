class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    @item.name = params[:item][:name]
    @item.user = current_user


    if @item.save
      flash[:notice] = "item added to todo list"
      redirect_to root_path
    else
      flash.now[:alert] = "there was an error saving the item"
      render :new
    end
  end

  def destroy
    # raise params[:id]

    @item = Item.find_by(id: params[:id])
    if @item.destroy
      flash[:notice] = "item deleted"
      redirect_to root_path
    else
      flash.now[:alert] = "error deleting item"
      render :show
    end
  end
end
