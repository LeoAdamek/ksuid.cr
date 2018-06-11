require "../src/ksuid.cr"
require "benchmark"

include Ksuid

g = Generator.new

n = 10_000

Benchmark.bm do |m|
  m.report("generate:") do
    n.times do
      k = g.generate
    end
  end
end


