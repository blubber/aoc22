scores = %{
  "A" => 1,
  "X" => 1,
  "B" => 2,
  "Y" => 2,
  "C" => 3,
  "Z" => 3
}

calculate_score = fn sequence ->
  sequence
  |> Enum.map(fn
    {b, b} -> b + 3
    {3, 1} -> 7
    {1, 3} -> 3
    {a, b} when b > a -> b + 6
    {_, b} -> b
  end)
  |> Enum.sum()
end

sequence =
  File.stream!("guide.txt")
  |> Enum.map(&String.trim/1)
  |> Enum.map(&String.split/1)
  |> Enum.map(fn [a, b] -> {scores[a], scores[b]} end)

sequence
|> calculate_score.()
|> IO.puts()

sequence
|> Enum.map(fn
  {a, 1} -> {a, if(a == 1, do: 3, else: a - 1)}
  {a, 2} -> {a, a}
  {a, 3} -> {a, if(a == 3, do: 1, else: a + 1)}
end)
|> calculate_score.()
|> IO.puts()
