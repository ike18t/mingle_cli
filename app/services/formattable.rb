module Formattable
  def format string
    string.scan(/\[([^\]]*)\]/).flatten.inject(string) { |string, prop|
      string.gsub("[#{prop}]", self.send(prop) || 'not set')
    }
  end
end
