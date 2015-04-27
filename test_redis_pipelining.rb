require 'rubygems'
require 'redis'

# Pipelining Benchmark
# This will be very crucial as the time required to fetch data is reduced significantly

def bench(descr)
  start = Time.now
  yield
  puts "#{descr} #{Time.now-start} seconds"
end

def without_pipelining
  r = Redis.new(:host => '178.62.200.133')
  100.times {
    r.ping
  }
end

def with_pipelining
  r = Redis.new(:host => '178.62.200.133')
  r.pipelined {
    100.times {
      r.ping
    }
  }
end

def just_one_ping
  r = Redis.new(:host => '178.62.200.133')
  r.ping
end

bench('without pipelining') {
  without_pipelining
}
bench('with pipelining') {
  with_pipelining
}
bench('just_one_ping') {
  with_pipelining
}
