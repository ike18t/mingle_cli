module Formattable
  def format string
    string.scan(/\[([^\]]*)\]/).flatten.inject(string) do |string, prop|
      string.gsub("[#{prop}]", self.send(prop) || 'not set')
    end
  end
end
