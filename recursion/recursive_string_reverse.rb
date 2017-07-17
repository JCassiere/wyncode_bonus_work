def recursive_string_reverse(string)
  if string.length == 1
    string
  else
    string[-1] + recursive_string_reverse(string.slice(0, string.length-1))
  end
end

puts recursive_string_reverse("yellow")
puts recursive_string_reverse("The quick brown fox jumped over the lazy dog")