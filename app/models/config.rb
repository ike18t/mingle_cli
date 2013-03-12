module Application
  class Config
    attr_accessor :hostname, :username, :password

    def initialize args={}
      args.each { |arg, val| self.send("#{arg}=", val) }
    end
  end
end
