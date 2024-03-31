class Book
  attr_accessor :title, :price

  def initialize(title, price = 8)
    @title = title
    @price = price
  end
end
