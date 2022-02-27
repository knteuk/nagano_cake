class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
      if @item.save
        redirect_to admin_items_path(@item.id)
        flash[:success] = "商品を登録しました"
      # elsif
      #   flash[:danger] = "必要情報を入力してください"
      #   render "admin/item/new"
      # elsif
      #   flash[:danger] = "価格は半角数字で記入してください"
      #   redirect_to new_admin_item_path
      # unless @item.save
      #   flash[:danger] = "必要情報を入力してください"
      #   render "admin/item/new"
      # end
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
      # else
      #   flash[:danger] = "必要情報を入力してください"
      #   render "admin/items/edit"
      # end
      # else
      #   flash[:danger] = "価格は半角数字で記入してください"
      #   # redirect_to edit_admin_item_path(@item.id)
      #   render "admin/items/edit"
      # end
      # else
      # unless @item.update(item_params)
      #   flash[:danger] = "必要情報を入力してください"
      #   render "admin/items/edit"
      # end
      end
  end

  private

  def item_params
    params.require(:item).permit(:name, :genre_id, :introduction, :image_id, :price)
  end

end
