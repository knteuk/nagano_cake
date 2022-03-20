class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @items = Item.page(params[:page]).per(8)
  end

  def show
    @cart_item = CartItem.new
  	@genres = Genre.all
  	@item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :genre_id, :introduction, :image, :price, :is_active)
  end

end
