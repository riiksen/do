class DiscountCode < Granite::ORM::Base
  adapter sqlite
  table_name discount_codes


  # id : Int64 primary key is created for you
end
