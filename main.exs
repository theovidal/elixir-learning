defmodule Game do
  def play_turn(number) do
    play_turn(number, 7)
  end

  def play_turn(number, trials_left) do
    prompt = 
      IO.gets("Donne un nombre : ")
      |> String.trim_trailing
      |> String.to_integer
      
    if prompt == number do
      IO.puts "Bravo, c'est gagné!"
    else
      if prompt > number, do: IO.puts "Non! C'est moins!"
      if prompt < number, do: IO.puts "Non! C'est plus!"

      trials_left = trials_left - 1
      if trials_left === 0 do
        IO.puts "Vous n'avez plus d'essais restants..."
      else
        play_turn(number, trials_left)
      end
    end
  end
end

IO.puts "Bienvenue dans ce jeu de devinette !"
:rand.uniform() * 100
  |> Float.floor
  |> Game.play_turn
