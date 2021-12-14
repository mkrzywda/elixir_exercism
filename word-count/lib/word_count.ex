defmodule WordCount do
  @doc """
  Count the number of words in the sentence.
  Words are compared case-insensitively
  """

  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.replace(",", " ")
    |> String.replace(~r/'(.)'/, "\\1")
    |> String.replace(~r/"|!|\n|\:|\&|\@|\$|\%|\^|\&|\./, "")
    |> String.split(["  "," ", "_"])
    |> Enum.map(&(String.trim(&1, "'")))
    |> Enum.filter(&(&1 != ""))
    |> Enum.reduce(%{}, fn (symbol, acc) ->
      Map.update(acc, symbol, 1, &(&1 + 1))
    end)
  end
end
