defmodule TodoListWeb.ItemView do
  use TodoListWeb, :view

  # add class "completed" to a list item if item.status = 1
  def complete(item) do
    case item.status do
      1 -> "completed"
      _ -> "" # empty string means empty class so no style
    end
  end

  # add "checked" to input if item.status = 1
  def checked(item) do
    case item.status do
      1 -> "checked"
      _ -> ""
    end
  end
end
