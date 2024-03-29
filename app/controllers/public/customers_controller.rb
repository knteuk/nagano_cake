class Public::CustomersController < ApplicationController

  def show
  	@customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_path
      flash[:success] = "会員情報を更新しました"
    else
      render 'edit'
    end
  end

  def quit
    @customer = current_customer
  end

  def out
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path, notice: 'ありがとうございました。またのご利用を心よりお待ちしております。'
  end

  private
  def customer_params
  	  params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
  	                                   :email, :password, :postal_code, :address, :telephone_number, :is_active)
  end
end
