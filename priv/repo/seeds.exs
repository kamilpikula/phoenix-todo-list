# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
  alias TodoList.Todo

  items = [
    %{text: "active task", status: 0},
    %{text: "completed task", status: 1}
  ]

  Enum.each(items, fn(item) ->
    Todo.create_item(item)
  end)
#     TodoList.Repo.insert!(%TodoList.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
