#1.	Replace Conditional with Polymorphism
defprotocol Payment do
  @doc "Processes a payment"
  def process(payment, amount)
end

defmodule CreditCardPayment do
  defstruct []
  defimpl Payment do
    def process(_, amount), do: "Processing #{amount} with Credit Card"
  end
end

defmodule PayPalPayment do
  defstruct []
  defimpl Payment do
    def process(_, amount), do: "Processing #{amount} with PayPal"
  end
end
defmodule BankTransferPayment do
  defstruct []
  defimpl Payment do
    def process(_, amount), do: "Processing #{amount} with Bank Transfer"
  end
end
# Використання
Payment.process(%CreditCardPayment{}, 100)
Payment.process(%PayPalPayment{}, 200)


# Replace Nested Conditional with Guard Clauses
defmodule Discount do
  def apply_discount(order_amount) when order_amount > 5000 do
    order_amount * 0.8
  end
  def apply_discount(order_amount) when order_amount > 1000 do
    order_amount * 0.9
  end
  def apply_discount(order_amount) do
    order_amount
  end
end


# Replace Temp with Query
defmodule Order do
  def calculate_total(order) do
    base_price(order) - discount(order) + tax(order)
  end

  defp base_price(order), do: Enum.sum(order.items)

  defp discount(order) do
    if base_price(order) > 1000, do: base_price(order) * 0.1, else: 0
  end

  defp tax(order), do: base_price(order) * 0.2
end
