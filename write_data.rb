require 'redis'
require './connect_to_server'

class Write_Data
  def initialize(key, value)
    @key = key
    @value = value
  end

  def store_key_value
    r = Connect_To_Server.new.connect_to_server
    #r.set(@key, @value)
    puts r.set(@key, @value).eql?('OK') ? 'Successfully saved data to database' : 'Failed to store data in databse'
  end
end

w = Write_Data.new('test_key', 'test_value')
w.store_key_value