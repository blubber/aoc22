defmodule Puzzle4 do
  def part1(input_file) do
    input_file
    |> parse()
    |> Enum.map(fn
      [[a, b], [c, d]] when a >= c and b <= d -> 1
      [[a, b], [c, d]] when c >= a and d <= b -> 1
      _ -> 0
    end)
    |> Enum.sum()
    |> IO.inspect()

    input_file
  end

  def part2(input_file) do
    input_file
    |> parse()
    |> Enum.map(fn [[a, b], [c, d]] ->
      {Range.new(a, b), Range.new(c, d)}
    end)
    |> Enum.reject(fn {a, b} -> Range.disjoint?(a, b) end)
  |> length()
    |> IO.inspect()

    input_file
  end

  def parse(input_file) do
    File.stream!(input_file)
    |> Enum.map(&String.trim/1)
    |> Enum.map(fn line ->
      line
      |> String.split(",")
      |> Enum.map(&parse_range/1)
    end)
  end

  def parse_range(string) do
    string
    |> String.split("-")
    |> Enum.map(fn value ->
      {num, _} = Integer.parse(value)
      num
    end)
  end
end

System.argv()
|> hd
|> Puzzle4.part1()
|> Puzzle4.part2()
