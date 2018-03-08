table
  thead
    tr
      th Name
      th Amount
      th Price
  tbody
    - order.products.each do |product|
      tr
        td = product.name
        td 1
        td = product.price