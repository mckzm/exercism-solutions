defmodule RPG.CharacterSheet do
  @spec welcome() :: :ok
  def welcome() do
    "Welcome! Let's fill out your character sheet together."
    |> IO.puts()
  end

  @spec ask_name() :: String.t()
  def ask_name() do
    "What is your character's name?\n"
    |> gets_trimmed()
  end

  @spec ask_class() :: String.t()
  def ask_class() do
    "What is your character's class?\n"
    |> gets_trimmed()
  end

  @spec ask_level() :: integer()
  def ask_level() do
    "What is your character's level?\n"
    |> gets_trimmed()
    |> String.to_integer()
  end

  @spec run() :: %{ name: String.t(), class: String.t(), level: integer() }
  def run() do
    welcome()

    %{
      name: ask_name(),
      class: ask_class(),
      level: ask_level(),
    }
    |> IO.inspect(label: "Your character")
  end

  defp gets_trimmed(prompt), do: IO.gets(prompt) |> String.trim()
end
