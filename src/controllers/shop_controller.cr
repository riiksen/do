class ShopController < ApplicationController
  def all
    render("all.slang")
  end

  def show
    render("show.slang")
  end

  def cart
    render("cart.slang")
  end
end