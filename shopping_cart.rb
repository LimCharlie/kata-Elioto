class ShoppingCart
  DISCOUNTS = {
    2 => 0.05,
    3 => 0.10,
    4 => 0.20,
    5 => 0.25
  }.freeze

  def initialize
    @books = []
  end

  def add_book(book)
    @books << book
  end

  def total_price
    total_price = @books.map(&:price).sum
    discount = calculate_discount(total_price)

    total_price - discount
  end

  def calculate_discount(total_price)
    differents_books = @books.map(&:title).uniq.size
    DISCOUNTS[differents_books].to_f * total_price
  end
end
