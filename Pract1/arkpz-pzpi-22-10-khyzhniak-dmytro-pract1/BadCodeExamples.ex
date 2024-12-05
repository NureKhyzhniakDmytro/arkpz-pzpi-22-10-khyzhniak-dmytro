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

# Приклад №4
defmodule OrderService do
  def create_order(params) do
    params
    |> validate()
    |> process_payment()
    |> save_to_db()
  end
end

# Приклад №5
def place_order(params) do
  case validate(params) do
    :ok -> process_order(params)
    :error -> :validation_failed
  end
end
