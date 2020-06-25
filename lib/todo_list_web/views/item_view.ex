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

  def remaining_items(items) do
    Enum.filter(items, fn i -> i.status == 0 end) |> Enum.count
  end

  def filter(items, str) do
    case str do
      "all"       -> items
      "active"    -> Enum.filter(items, fn i -> i.status == 0 end)
      "completed" -> Enum.filter(items, fn i -> i.status == 1 end)
    end
  end

  def selected(filter, str) do
    case filter == str do
      true -> "selected"
      false -> ""
    end
  end

  def pluralise(items) do
    case remaining_items(items) == 0 || remaining_items(items) > 1 do
      true  -> "items"
      false -> "item"
    end
  end

  def got_items?(items) do
    Enum.filter(items, fn i -> i.status < 2 end) |> Enum.count > 0
  end
end
