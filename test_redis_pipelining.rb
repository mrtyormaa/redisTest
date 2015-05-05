require 'rubygems'
require 'redis'
require './connect_to_server'

# Pipelining Benchmark
# This will be very crucial as the time required to fetch data is reduced significantly

def bench(descr)
  start = Time.now
  yield
  puts "#{descr} : #{Time.now-start} seconds"
end

def without_pipelining
  r = Connect_To_Server.new.connect_to_server
  100.times {
    r.ping
  }
end

def with_pipelining
  r = Connect_To_Server.new.connect_to_server
  r.pipelined {
    100.times {
      r.ping
    }
  }
end

def just_one_ping
  r = Connect_To_Server.new.connect_to_server
  r.ping
end

bench('without pipelining') {
  puts 'Pinging Server 100 times without PipeLining'
  without_pipelining
}
bench('with pipelining') {
  puts 'Pinging Server 100 times with PipeLining'
  with_pipelining
}
bench('just_one_ping') {
  puts 'Pinging Server just once'
  with_pipelining
}