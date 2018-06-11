require "time"
require "atomic"

module Ksuid
  
  class Generator

    getter partitioner
    setter partitioner
    @partitioner : -> UInt32
    @seq         : Atomic(UInt32)

    def initialize(partitioner : -> UInt32 = Partitioner.no_partitions)
      @partitioner = partitioner
      @seq = Atomic.new(0_u32)

      spawn do
        loop do
          @seq.set(0_u32)
          sleep 1
        end
      end
      
    end

    def generate
      ts = (Time.now.epoch - EPOCH).to_u32
      
      part = @partitioner.call
      seq = @seq.get

      @seq.add(1_u32)

      Ksuid.new(ts, seq, part)
    end
    
  end
end
