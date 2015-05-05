require 'redis'

class Connect_To_Server

  def connect_to_server
    Redis.new(:host => '178.62.200.133')
  end

end