module Formattable
  def format string
    string.scan(/\[([^\]]*)\]/).flatten.inject(string) do |string, prop|
      string.gsub("[#{prop}]", self.send(prop).to_s)
    end
  end
end
