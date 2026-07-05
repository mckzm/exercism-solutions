defmodule RPG.CharacterSheet do
  @spec welcome() :: String.t()
  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end

  @spec ask_name() :: String.t()
  def ask_name() do
    IO.gets("What is your character's name?\n") |> String.trim
  end

  @spec ask_class() :: String.t()
  def ask_class() do
    IO.gets("What is your character's class?\n") |> String.trim
  end

  @spec ask_level() :: String.t()
  def ask_level() do
    IO.gets("What is your character's level?\n") |> String.trim |> String.to_integer
  end

  @spec run() :: String.t()
  def run() do
    welcome()
    chara = %{
      name: ask_name(),
      class: ask_class(),
      level: ask_level(),
    }
    IO.inspect(chara, label: "Your character")
  end
end
