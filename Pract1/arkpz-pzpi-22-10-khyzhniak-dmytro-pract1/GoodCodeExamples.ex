# Приклад №1
defmodule UserManagementService do
  def update_user(user_params), do: update_in_database(user_params)
end

# Приклад №2
def create_order(params) do
  params
  |> validate()
  |> process_payment()
  |> save_to_db()
end

# Приклад №3
def handle_order_response(%{status: :ok}), do: :order_successful
def handle_order_response(_), do: :order_failed

# Приклад №4
defmodule OrderService do
  @moduledoc """
  Модуль, що обробляє замовлення користувачів.
  """
  @doc """
  Створює нове замовлення та зберігає його в базі даних.
  """
  def create_order(params) do
    params
    |> validate()
    |> process_payment()
    |> save_to_db()
  end
end

# Приклад №5
def place_order(params) do
  with :ok <- validate(params),
       processed_order <- process_order(params) do
    processed_order
  else
    :error -> :validation_failed
  end
end
