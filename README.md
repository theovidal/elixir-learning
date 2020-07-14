# ⚗ Elixir learning projects

This repository is an archive of all the little scripts I made in order to get familiar with the Elixir programming language.

- [❓ Guessing game](#-guessing-game)
- [📔 Contacts directory](#-contacts-directory)
- [⛅ Weather](#-weather)

## ❓ Guessing game

This is a simple number guessing game : a number between 0 and 100 is randomly generated, and the user has a limited number of trials in order to guess it.

Goals :

- Start writing real Elixir code
- Discover recursion (I always touched loops, but never this)
- Get used to the pipe operator

[View the script](./guessing_game.exs)

## 📔 Contacts directory

A simple list of contacts.

Goals :

- Use maps and lists
- Discover enumerables and use them (instead of loops)
- Write simple structs

[View the script](./contacts.exs)

## ⛅ Weather

A little library that fetches the weather for a specific location thanks to the OpenWeatherMap API.

Goals :

- Interact with native Erlang modules
- Make HTTP requests and parse JSON out of them
- Start building Mix projects with unit testing

[View the project](./weather)
