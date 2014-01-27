module Application
  class Config
    require 'base64'
    require 'aescrypt'

    attr_accessor :hostname, :username, :password, :project

    def initialize args={}
      args.each { |arg, val| self.send("#{arg}=", val) }
    end

    PasswordKey = 'secret_key'

    def password= value
      @password = AESCrypt.encrypt(value, PasswordKey)
    end

    def password
      return nil if @password.nil?
      AESCrypt.decrypt(@password, PasswordKey)
    end
  end
end
