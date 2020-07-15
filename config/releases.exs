import Config

config :todo_list, TodoListWeb.Endpoint,
  server: true,
  http: [port: {:system, "PORT"}],
  url: [host: "madeup-reflecting-frenchbulldog.gigalixirapp.com", port: 443]
