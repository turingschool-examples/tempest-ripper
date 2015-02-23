class Ripper
  def parse_line(data)
    data.downcase.scan(/\w+/)
  end
end
