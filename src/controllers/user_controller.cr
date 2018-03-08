class UserController < ApplicationController
  before_action do
    #all { redirect_signed_out_user }
    only [:logout, :orders, :order] do
      redirect_signed_out_user
    end
  end

  def verify
    #if params[:valpar]

    render("verify.slang")
  end

  def login

    #valpar = params.validation do
    #  required(:email) { |f| !f.nil? }
    #  required(:password) { |f| !f.nil? }
    #end

    user = User.find_by(:email, params["email".to_s])
    if user && user.authenticate(params["password"].to_s)
      session[:user_id] = user.id
      flash[:info] = "Successfully logged in"
      redirect_to "/"
    else
      flash[:danger] = "Invalid email or password"
      user = User.new
      render("login.slang")
    end

    render("login.slang")
  end

  def register
    valpar = params.validation do
      required(:email) { |f| !f.nil? }
      required(:password) { |f| !f.nil? }
    end

    user = User.new(valpar.validate!)

    user.password = params["password"].to_s

    if user.valid? && user.save
      session[:user_id] = user.id
      flash["success"] = "Created User successfully"
      redirect_to "/"
    else
      flash["danger"] = "Could not create User!"
      #render("")
    end

    render("register.slang")
  end

  def logout
    session.delete(:user_id)
    flash[:info] = "Logged out"
    redirect_to(
      PagesController,
      action: :home,
      flash: {
        "info" => "Looged out"
      })
    #render("home.slang", path: "home")
  end

  def orders
    user = User.find session[:user_id]
    render("orders.slang")
  end

  def order
    user = User.find session[:user_id]
    #order = user.orders.find params[:id]
    #render("order.slang")
  end

#  def show
#    render("show.slang") if (user = current_user)
#  end
#
#  def edit
#    render("edit.slang") if (user = current_user)
#  end
#
#  def update
#    user = current_user
#    if update(user)
#      flash[:success] = "Updated Profile successfully."
#      redirect_to "/profile"
#    elsif user
#      flash[:danger] = "Could not update Profile!"
#      render("edit.slang")
#    else
#      flash[:info] = "Must be logged in"
#      redirect_to "/signin"
#    end
#  end

  private def update(user)
    return false unless user && user_params.valid?
    user.set_attributes(user_params.to_h)
    user.valid? && user.save
  end

  private def user_params
    params.validation do
      required(:email) {|f| !f.nil? && !f.empty? }
      optional(:password) {|f| !f.nil? && !f.empty? }
    end
  end
end