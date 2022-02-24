class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity = 1)
    self.last_transaction = price * quantity
    self.total += self.last_transaction
    quantity.times { |product| self.items << item }
  end

  def apply_discount
    self.total *= (1 - (self.discount / 100.0))
    if self.discount != 0
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= self.last_transaction
  end
end
