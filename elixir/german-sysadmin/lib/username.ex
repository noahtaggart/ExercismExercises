defmodule Username do
  def sanitize('') do
  ''
  end
  def sanitize([head | tail]) do

  result = case head do
    ?ä -> 'ae'
    ?ö -> 'oe'
    ?ü -> 'ue'
    ?ß -> 'ss'
    x when x >= ?a and x<= ?z -> [x]
    ?_ -> [?_]
    _ -> ''
  end
  result ++ sanitize(tail)
  end
end
