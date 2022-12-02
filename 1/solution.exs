File.stream!("input.txt")
|> Enum.map(&String.trim/1)
|> Enum.reduce(
  [0],
  fn
    "", sums ->
      [0 | sums]

    line, [sum | sums] ->
      {calories, _} = Integer.parse(line)
      [sum + calories | sums]
  end
)
|> Enum.sort(:desc)
  |> Enum.take(3)
  |> IO.inspect()
  |> Enum.sum()
  |> IO.inspect()
