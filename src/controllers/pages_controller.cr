class PagesController < ApplicationController
  #before_action do
  #  only [:login, :signup] do
  #    redirect_signed_user
  #  end
  #end

  def home
    render("home.slang")      
  end

  def contact
    render("contact.slang")
  end

  def login
    render("login.slang")
  end

  def signup
    render("signup.slang")
  end
end
