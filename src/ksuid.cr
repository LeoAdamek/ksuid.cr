require "time"

module Ksuid
  EPOCH = Time.new(2000, 1, 1).epoch.to_u32
end

require "./ksuid/*"
