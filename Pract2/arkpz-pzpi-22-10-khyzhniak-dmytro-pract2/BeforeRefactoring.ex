# Replace Conditional with Polymorphism
defmodule PaymentProcessor do
  def process(payment_type, amount) do
    case payment_type do
      :credit_card -> "Processing #{amount} with Credit Card"
      :paypal -> "Processing #{amount} with PayPal"
      :bank_transfer -> "Processing #{amount} with Bank Transfer"
      _ -> "Unknown payment type"
    end
  end
end


# Replace Nested Conditional with Guard Clauses
defmodule Discount do
  def apply_discount(order_amount) do
    if order_amount > 1000 do
      if order_amount > 5000 do
        order_amount * 0.8
      else
        order_amount * 0.9
      end
    else
      order_amount
    end
  end
end


# Replace Temp with Query
defmodule Order do
  def calculate_total(order) do
    base_price = Enum.sum(order.items)
    discount = if base_price > 1000, do: base_price * 0.1, else: 0
    tax = base_price * 0.2
    base_price - discount + tax
  end
end
