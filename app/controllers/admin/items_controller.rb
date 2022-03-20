class Admin::ItemsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
      if @item.save
        redirect_to admin_item_path(@item.id)
        flash[:success] = "商品を登録しました"
      end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_items_path(@item)
      flash[:success] = "商品を更新しました"
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :genre_id, :introduction, :image, :price, :is_active)
  end

end
