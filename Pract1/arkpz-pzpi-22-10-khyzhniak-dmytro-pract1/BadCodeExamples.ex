# Приклад №1
defmodule UMS do
  def a(u), do: update_in_db(u)
end

# Приклад №2
def create_order(params) do
  validated_params = validate(params)
  processed_params = process_payment(validated_params)
  save_to_db(processed_params)
end

# Приклад №3
def handle_order_response(response) do
  if response[:status] == :ok do
    :order_successful
  else
    :order_failed
  end
end
