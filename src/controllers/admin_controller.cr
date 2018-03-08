class AdminController < ApplicationController
  def login
    render("login.slang")
  end

  def dashboard
    render("dashboard.slang", layout: "admin.slang")
  end
end
