defmodule TodoListWeb.ItemViewTest do
  use TodoListWeb.ConnCase, async: true
  alias TodoListWeb.ItemView

  @active_item [%{text: "one", status: 0}]
  @completed_item [%{text: "one", status: 1}]
  @clear_items []
  @items [
    %{text: "one", status: 0},
    %{text: "two", status: 0},
    %{text: "tree", status: 1},
    %{text: "four", status: 2}
  ]

  test "complete/1 returns completed if item.status == 1" do
    assert ItemView.complete(%{status: 1}) == "completed"
  end

  test "complete/1 returns empty string if item.status == 0" do
    assert ItemView.complete(%{status: 0}) == ""
  end

  test "checked/1 returns checked if item.status == 1" do
    assert ItemView.checked(%{status: 1}) == "checked"
  end

  test "checked/1 returns empty string if item.status == 0" do
    assert ItemView.checked(%{status: 0}) == ""
  end

  test "remaining_items/1 returns count of items where item.status==0" do
    assert ItemView.remaining_items(@items) == 2
  end

  test "remaining_items/1 returns 0 (zero) when no items are status==0" do
    assert ItemView.remaining_items(@clear_items) == 0
  end

  test "selected/2 returns class 'selected' if filter == item" do
    assert ItemView.selected("all", "all") == "selected"
    assert ItemView.selected("all", "active") == ""
  end

  test "pluralise/1 returns item for 1 item or items for > 1" do
    assert ItemView.pluralise(@active_item) == "item"
    assert ItemView.pluralise(@items) == "items"
    assert ItemView.pluralise(@completed_item) == "items"
  end

  test "got_items?/1 returns true when items are status == 0 or status == 1" do
    assert ItemView.got_items?(@items) == true
  end
end
