class ErrorController < Amber::Controller::Error
  #LAYOUT = "application.slang"

  def forbidden
    render("forbidden.slang", layout: false)
  end

  def not_found
    render("not_found.slang", layout: false)
  end

  def internal_server_error
    render("internal_server_error.slang", layout: false)
  end
end
