class Sorter
  def sort(orders, type)
    if type == :BUY
      orders.sort_by { |order| order[:price] }.reverse!
    else
      orders.sort_by { |order| order[:price] }
    end
  end
end
