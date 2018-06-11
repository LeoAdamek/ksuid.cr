module Ksuid
  class Ksuid

    getter seq, part

    @ts   : UInt32
    @seq  : UInt32
    @part : UInt32
    

    def initialize(ts : UInt32, seq : UInt32, part : UInt32)
      @ts = ts
      @seq = seq
      @part = part
    end

    ##
    # Gets the timestamp of when this KSUID was generated
    # as a Time
    def timestamp : Time
      Time.epoch(EPOCH.to_i64 + @ts.to_i64)
    end

    ##
    # Get the valud of this KSUID as a UInt128
    #
    # Numerical sorting will provide
    def to_u128 : UInt128
      (@ts.to_u128 << 64) +
      (@seq.to_u128 << 32) +
       @part.to_u128
    end

    ##
    # Stringify KSUID
    def to_s(base : Int = 62, upcase : Bool = false) : String
      [@ts.to_s(base, upcase), @seq.to_s(base, upcase), @part.to_s(base, upcase)].join
    end


    ##
    # Parse an integer KSUID to a KSUID
    def self.parse(val : UInt128) : Ksuid

      raise ValueError.new "Value is larger than maximum possible value." if val > (1 << 96)

      ts = (val >> 64).to_u32
      seq = (val >> 32).to_u32
      part = val.to_u32

      new(ts, seq, part)
    end

    ##
    # Parse a string KSUID to a KSUID
    def self.parse(val : String, base : Int = 62)
      self.parse(val.to_u128(base))
    end
  end
end
