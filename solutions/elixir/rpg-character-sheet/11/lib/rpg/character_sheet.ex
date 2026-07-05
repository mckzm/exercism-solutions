defmodule RPG.CharacterSheet do
  @spec welcome() :: :ok
  def welcome() do
    "Welcome! Let's fill out your character sheet together."
    |> IO.puts()
  end

  @spec ask_name() :: String.t()
  def ask_name() do
    "What is your character's name?"
    |> ask_and_trim()
  end

  @spec ask_class() :: String.t()
  def ask_class() do
    "What is your character's class?"
    |> ask_and_trim()
  end

  @spec ask_level() :: integer()
  def ask_level() do
    "What is your character's level?"
    |> ask_and_trim()
    |> String.to_integer()
  end

  @spec run() :: %{ name: String.t(), class: String.t(), level: integer() }
  def run() do
    welcome()

    %{
      name:  ask_name(),
      class: ask_class(),
      level: ask_level(),
    }
    |> IO.inspect(label: "Your character")
  end

  @spec ask_and_trim(String.t()) :: String.t()
  defp ask_and_trim(prompt) do
    prompt
    |> Kernel.<>("\n")
    |> IO.gets()
    |> String.trim()
  end
end
