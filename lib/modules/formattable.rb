module Formattable
  def format string
    string.scan(/\[([^\]]*)\]/).flatten.inject(string) do |string, prop|
      begin
        value = self.send(prop).to_s
      rescue NoMethodError
        value = ''
      end
      string.gsub("[#{prop}]", value)
    end
  end
end
