require 'redis'

# This experiment benchmarks some basic functions to be performed ont he server.

def bench(descr)
  start = Time.now
  yield
  puts "#{descr} #{Time.now-start} seconds"
end

def ping_server
  r = connect_to_server
  puts r.ping
end

def get_hash_value_for_key_hello
  r = connect_to_server
  puts r.get('hello')
end

def get_all_keys
  r = connect_to_server
  puts "#{r.keys('*').length} keys retrieved"
end

def connect_to_server
  Redis.new(:host => '178.62.200.133')
end

bench('ping_server') {
  puts 'Sending Ping to Server'
  ping_server
}

bench('get_hash_value_for_key_hello') {
  puts "Request data from server for the key 'hello'"
  get_hash_value_for_key_hello
}

bench('get_all_keys') {
  puts 'Retrieve all Keys'
  get_all_keys
}