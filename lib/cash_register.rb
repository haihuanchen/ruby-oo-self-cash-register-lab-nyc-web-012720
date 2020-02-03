require 'pry'

class CashRegister
    attr_accessor :total, :discount, :price, :items
    def initialize (discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(name, price, quantity = 1)
        @price = price * quantity
        @total += price * quantity
        if quantity > 1
            quantity.times.each do |num|
                @items << name
            end
        else 
            @items << name
        end
        
    end

    def apply_discount
        if @discount > 0
            take_off = (price * discount)/100
            @total -= take_off
            return "After the discount, the total comes to $#{total}."
          else
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        # binding.pry
        @total = @total - @price
        # binding.pry
        if @items.length < 1
            return @total = 0.0
        else 
            return @total
        end
    end
end
