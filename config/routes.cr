Amber::Server.configure do |app|
  pipeline :web, :auth do
    # Plug is the method to use connect a pipe (middleware)
    # A plug accepts an instance of HTTP::Handler
    plug Amber::Pipe::Error.new
    plug Amber::Pipe::Logger.new
    plug Amber::Pipe::Session.new
    plug Amber::Pipe::Flash.new
    plug Amber::Pipe::CSRF.new
    #plug Amber::Pipe::CORS.new
    # Reload clients browsers (development only)
    plug Amber::Pipe::Reload.new if Amber.env.development?
  end
  
  # pipeline :transaction do
  # 
  # end
  # 
  # pipeline :confirmation do
  # 
  # end

  pipeline :admin do 
    plug Authenticate.new
  end

  # All static content will run these transformations
  pipeline :static do
    plug Amber::Pipe::Error.new
    plug Amber::Pipe::Static.new("./public")
  end

  routes :static do
    # Each route is defined as follow
    # verb resource : String, controller : Symbol, action : Symbol
    get "/*", Amber::Controller::Static, :index
  end

  # routes :admin do
  #   get "/admin", AdminController, :dashboard
  # end

  routes :admin, "/admin" do
    get "/", AdminController, :dashboard
  end

  routes :web do
    get "/", PagesController, :home
    get "/contact", PagesController, :contact
    get "/login", PagesController, :login
    get "/signup", PagesController, :signup
    #get "/forgot", PagesController, :forgot
    # Session related routes
    #get "/signup", UserController, :register
    post "/signup", UserController, :register
    # get "/login", UserController, :login
    post "/login", UserController, :login
    get "/logout", UserController, :logout
    #post "/forgot", UserController, :forgot
    get "/verify/:vkey", UserController, :verify
    get "/orders", UserController, :orders
    get "/order/:id", UserController, :order
    # Shop related routes
    get "/products", ShopController, :all
    get "/products/:id", ShopController, :show
    get "/cart", ShopController, :cart
  end

  #routes :web do
  #  #get "/:layout/", HomeController, :index
  #  get "/profile", UserController, :show
  #  get "/profile/edit", UserController, :edit
  #  patch "/profile", UserController, :update
  #  get "/signin", SessionController, :new
  #  post "/session", SessionController, :create
  #  get "/signout", SessionController, :delete
  #  get "/signup", RegistrationController, :new
  #  post "/registration", RegistrationController, :create
  #  get "/contact", HomeController, :contact
  #  get "/", HomeController, :index
  #end
end
