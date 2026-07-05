defmodule RPG.CharacterSheet do
  @spec welcome() :: :ok
  def welcome() do
    "Welcome! Let's fill out your character sheet together."
    |> IO.puts()
  end

  @spec ask_name() :: String.t()
  def ask_name(), do: :name |> ask_and_trim()

  @spec ask_class() :: String.t()
  def ask_class(), do: :class |> ask_and_trim()

  @spec ask_level() :: integer()
  def ask_level(), do: :level |> ask_and_trim() |> String.to_integer()

  @spec run() :: %{name: String.t(), class: String.t(), level: integer()}
  def run() do
    welcome()

    %{
      name: ask_name(),
      class: ask_class(),
      level: ask_level()
    }
    |> IO.inspect(label: "Your character")
  end

  @spec ask_and_trim(atom()) :: String.t()
  defp ask_and_trim(field) do
    "What is your character's #{field}?\n"
    |> IO.gets()
    |> String.trim()
  end
end
