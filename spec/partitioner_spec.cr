require "./spec_helper"

describe "Partitioner" do

  describe "no_partitions" do
    it "always returns 0" do
      Partitioner.no_partitions.call.should eq 0_u32
      Partitioner.no_partitions.call.should eq 0_u32
      Partitioner.no_partitions.call.should eq 0_u32
      Partitioner.no_partitions.call.should eq 0_u32
    end
  end

  describe "hostname" do
    it "returns a value" do
      v1 = Partitioner.hostname.call
      v1.should eq Partitioner.hostname.call
    end
  end
end
