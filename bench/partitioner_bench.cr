require "../src/ksuid.cr"
require "benchmark"

include Ksuid

no_partitions = Partitioner.no_partitions
hostname      = Partitioner.hostname
str           = Partitioner.string "test"


Benchmark.ips do |m|
  m.report("none:") do
    no_partitions.call
  end

  m.report("hostname:") do
    hostname.call
  end

  m.report("string:") do
    str.call
  end
end
