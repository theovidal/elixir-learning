defmodule Game do
  def start do
    IO.puts "Welcome to the awesome Elixir guessing game!"
    trials = get_int_from_input("How many trials do you want? ")
    :rand.uniform() * 100
      |> trunc
      |> play_turn(trials)
  end

  def play_turn(number, 0) do
    IO.puts "You don't have any trials left! The number was #{number}."
  end

  def play_turn(number, trials_left) do
    prompt = get_int_from_input("Give a number : ")

    if prompt == number do
      IO.puts "Congratulations, you won!"
    else
      if prompt > number, do: IO.puts "That's less!"
      if prompt < number, do: IO.puts "That's more!"

      trials_left = trials_left - 1
      play_turn(number, trials_left)
    end
  end

  def get_int_from_input(message) do
    IO.gets(message)
      |> String.trim_trailing
      |> String.to_integer
  end
end

Game.start
