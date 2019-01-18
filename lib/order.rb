class Order
  attr_reader :user_id, :quantity, :price, :type

  def initialize
    @user_id = nil
    @quantity = nil
    @price = nil
    @type = nil
  end

  def create(user_id, quantity, price, type)
    @user_id = user_id
    @quantity = quantity
    @price = price
    @type = type
  end

end
