defmodule Contact do
  defstruct name: "", id: "", age: 18, teams: []
end

defmodule Book do
  def run do
    contacts = [
      %Contact{
        name: "Théo",
        id: "exybore",
        age: 17,
        teams: ["Writers", "Developers"]
      },
      %Contact{
        name: "Gildas",
        id: "gildasgh",
        age: 19,
        teams: ["Writers"]
      },
      %Contact{
        name: "Noéwen",
        id: "kernoeb",
        age: 18,
        teams: ["Social"]
      }
    ]

    Enum.each contacts, fn contact ->
      "#{contact.name} (@#{contact.id}) : "
        <> Enum.join(contact.teams, ",  ")
        |> IO.puts
    end

    total_age = Enum.reduce contacts, 0, fn x, acc -> x.age + acc end
    IO.puts "Medium contacts' age : #{total_age / length(contacts)}"
  end
end

Book.run
