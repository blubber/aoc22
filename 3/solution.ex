char_score = fn c -> if c < 91, do: c - 38, else: c - 96 end

File.stream!("input.txt")
|> Enum.map(&String.trim/1)
|> Enum.map(&to_charlist/1)
|> Enum.map(fn charlist ->
  scored = Enum.map(charlist, &char_score.(&1))

  [a, b] =
    Enum.chunk_every(scored, Integer.floor_div(length(scored), 2))
    |> Enum.map(&MapSet.new/1)

  MapSet.intersection(a, b)
end)
|> Enum.map(&Enum.sum/1)
|> Enum.sum()
|> IO.inspect()

with {:ok, contents} <- File.read("input.txt") do
  contents
end
|> String.trim()
|> String.split("\n")
|> Enum.map(&String.trim/1)
|> Enum.map(&to_charlist/1)
|> Enum.map(fn list ->
  Enum.map(list, fn c -> char_score.(c) end)
  |> MapSet.new()
end)
|> Enum.chunk_every(3)
|> Enum.map(fn [a, b, c] ->
  a
  |> MapSet.intersection(b)
  |> MapSet.intersection(c)
  |> MapSet.to_list()
  |> hd()
end)
|> Enum.sum()
|> IO.puts()
