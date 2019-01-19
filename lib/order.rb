class Order
  attr_reader :user_id, :quantity, :price, :type, :order_id

  def initialize(user_id, quantity, price, type, order_id)
    @user_id = user_id
    @quantity = quantity
    @price = price
    @type = type
    @order_id = order_id
  end
end
