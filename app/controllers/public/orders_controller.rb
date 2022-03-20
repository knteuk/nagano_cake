class Public::OrdersController < ApplicationController

  def new
    @addresses = current_customer.addresses
    @address = Address.new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.postage = 800
    @order.save
    current_customer.cart_items.each do |cart_item|
    @order_detail = OrderDetail.new
    @order_detail.item_id = cart_item.item_id
    @order_detail.order_id = @order.id
    @order_detail.quantity = cart_item.amount
    @order_detail.price = cart_item.item.price
    @order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to orders_thanks_path
  end

  def confirm
    @order = Order.new(order_params)
    @orders = current_customer.orders
    @total_price = calculate(current_customer)
    @order.postage = 800
      if params[:order][:address_select] == "0"
        @order.name = current_customer.last_name + current_customer.first_name
        @order.address = current_customer.address
        @order.postal_code = current_customer.postal_code
      elsif params[:order][:address_select] == "1"
        @order.name = Address.find(params[:order][:address_id]).name
        @order.address = Address.find(params[:order][:address_id]).address
        @order.postal_code = Address.find(params[:order][:address_id]).postal_code
      elsif params[:order][:address_select] == "2"
        @order.name = params[:order][:name]
        @order.address = params[:order][:address]
        @order.postal_code = params[:order][:postal_code]
      end
      # p @order
  end

  def thanks
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  private
  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end

  def order_params
    params.require(:order).permit(:customer_id, :address, :payment_method, :postage, :total_payment, :order_status, :name, :postal_code)
  end

  def calculate(customer)
    total_price = 0
    customer.cart_items.each do |cart_item|
    total_price += cart_item.amount * cart_item.item.price
  end
  return (total_price * 1.1).to_i
  end

end
