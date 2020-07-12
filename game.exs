defmodule Game do
  def start do
    IO.puts "Bienvenue dans ce jeu de devinette !"
    trials =
      IO.gets("Combien d'essais voulez-vous ? ")
      |> String.trim_trailing
      |> String.to_integer
    :rand.uniform() * 100
      |> Float.floor
      |> play_turn(trials)
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

Game.start
