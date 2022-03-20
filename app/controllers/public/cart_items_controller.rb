class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
    @total_price = calculate(current_customer)
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_items = current_customer.cart_items
    @finded_cart_item = @cart_items.find_by(item_id: cart_item_params[:item_id])
    if @finded_cart_item
      @new_amount = @finded_cart_item.amount.to_i + cart_item_params[:amount].to_i
      @finded_cart_item.update(amount: @new_amount)
      redirect_to cart_items_path
    else
      @cart_item.save
      redirect_to cart_items_path
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    flash[:danger] = "カートの商品を全て削除しました"
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end

  def calculate(customer)
    total_price = 0
    customer.cart_items.each do |cart_item|
    total_price += cart_item.amount * cart_item.item.price
    end
    return (total_price * 1.1).to_i.to_s(:delimited)
  end
end
