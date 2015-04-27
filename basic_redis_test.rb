require 'redis'

# This experiment benchmarks some basic functions to be performed ont he server.

def bench(descr)
  start = Time.now
  yield
  puts "#{descr} #{Time.now-start} seconds"
end

def ping_server
  r = Redis.new(:host => '178.62.200.133')
  puts r.ping
end

def get_hash_value_for_key_hello
  r = Redis.new(:host => '178.62.200.133')
  puts r.get('hello')
end

def get_all_keys
  r = Redis.new(:host => '178.62.200.133')
  puts "#{r.keys('*').length} keys retrieved"
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