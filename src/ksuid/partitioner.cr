require "system"

module Ksuid
  module Partitioner

    ##
    # Disables partitioning by always returning a partition of zero.
    def self.no_partitions : -> UInt32
      -> () { 0_u32 }
    end

    ##
    # Sets the partition based on the first 4 bytes of the hostname
    #
    # This method is suited to containerized environments where the system hostname is
    # guaranteed to be unique.
    def self.hostname : -> UInt32
      bytes = System.hostname.byte_slice(0, 4).bytes
      bs = Slice[bytes[0], bytes[1], bytes[2], bytes[3]]
      v = IO::ByteFormat::BigEndian.decode(UInt32, bs)

      -> () {
        v
      }
    end

    ##
    # Sets the partition based on the first 4 bytes of the given string
    #
    def self.string(s : String) : -> UInt32
      bytes = s.byte_slice(0, 4).bytes
      bs = Slice[bytes[0], bytes[1], bytes[2], bytes[3]]
      v = IO::ByteFormat::BigEndian.decode(UInt32, bs)
      
      -> () {
        v
      }
    end
  end
end
