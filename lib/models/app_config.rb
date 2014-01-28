require 'aescrypt'
require 'base64'

class AppConfig
  attr_accessor :hostname, :username, :password, :project

  def initialize args={}
    args.each { |arg, val| self.send("#{arg}=", val) }
  end

  PASSWORD_KEY = 'secret_key'

  def password= value
    @password = AESCrypt.encrypt(value, PASSWORD_KEY)
  end

  def password
    return nil if @password.nil?
    AESCrypt.decrypt(@password, PASSWORD_KEY)
  end
end
