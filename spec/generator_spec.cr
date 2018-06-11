require "./spec_helper"


describe "Generator" do
  describe "generate" do

    it "generates a ksuid" do
      g = Generator.new

      s = g.generate

      s.part.should eq 0_u32
      s.seq.should  eq 0_u32
    end
  end
end
