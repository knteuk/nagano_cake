class Public::HomesController < ApplicationController

before_action :authenticate_customer!, except: [:top, :about]

  def top
    @genres = Genre.all
    @items = Item.where(is_active: "販売可")
  end

  def about
  end

end
