require "granite_orm/adapter/sqlite"

class Product < Granite::ORM::Base
  adapter sqlite
  table_name products

  # id : Int64 primary key is created for you
  field name : String
  field price : Float32
  field image : String
  field hidden : Bool
end
