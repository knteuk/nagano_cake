class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @orders = Order.page(params[:page]).per(10)
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
		@order = Order.find(params[:id])
		@order_details = order.order_details
    @order.update(order_params)
		redirect_to admins_order_path(order.id)
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end

end
