# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  before_action :reject_customer, only: [:create]

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def reject_customer
    customer = Customer.find_by(email: params[:customer][:email].downcase)
    if customer
      if customer.valid_password?(params[:customer][:password]) && customer.is_active == false
        flash[:error] = "退会済みです。再度ご登録をお願いします。"
        redirect_to new_customer_session_path
      end
    else
      flash[:error] = "正しい情報を入力してください。"
    end
  end
end
