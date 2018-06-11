require "./spec_helper.cr"

K = Generator.new.generate


describe "Ksuid" do
  
  describe "timestamp" do

    it "returns a Time" do
      K.timestamp.should be_a Time
    end

    it "returns a reasonable time" do
      K.timestamp.year.should eq Time.now.year
      K.timestamp.month.should eq Time.now.month
      K.timestamp.day.should eq Time.now.day
    end
  end

  describe "to_u128" do
    it "returns a value" do
      p K.to_u128
      K.to_u128
    end
  end

  describe "to_s" do
    describe "without arguments" do
      it "returns a base62 string" do
        p K.to_s
      end
    end
  end

  describe "parse(UInt128)" do
    describe "when value is > 1<<96" do
      it "throws an error" do
        Ksuid::Ksuid.parse(1.to_u128 << 99)
      end
    end
  end
end
