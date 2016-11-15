RSpec.describe Rolis do
  describe "VERSION" do
    it "defines a version number" do
      expect(Rolis::VERSION).to match /\d+\.\d+\.\d+/
    end
  end
end
