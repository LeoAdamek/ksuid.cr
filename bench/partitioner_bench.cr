require "../src/ksuid.cr"
require "benchmark"

include Ksuid

no_partitions = Partitioner.no_partitions
hostname      = Partitioner.hostname


Benchmark.ips do |m|
  m.report("none:") do
    no_partitions.call
  end

  m.report("hostname:") do
    hostname.call
  end
end
