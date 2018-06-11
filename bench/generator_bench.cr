require "../src/ksuid.cr"
require "benchmark"

include Ksuid

g = Generator.new
k = g.generate

n = 10_000

Benchmark.ips do |i|
  i.report("generate:") do
    g.generate
  end

  i.report("to_s:") do
    k.to_s
  end

  i.report("to_u128:") do
    k.to_u128
  end
end


