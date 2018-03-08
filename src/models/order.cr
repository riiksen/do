require "granite_orm/adapter/sqlite"

class Order < Granite::ORM::Base
  adapter sqlite
  table_name orders
  field address : String
  field name : String
  field price : Float32
  field finished : Bool

  belongs_to :user
  has_many :products
end
