RSpec.describe Rolis do
  describe "#configure" do
    it "takes a block as parameter" do
      block = Proc.new { }
      expect { configure!(block) }.to_not raise_error
    end

    describe "the expected block" do
      it "takes one argument" do
        block = Proc.new { |*args| expect(args.size).to eq 1 }
        configure!(block)
      end

      describe "the passed argument" do
        it "is a Rolis::Config instance" do
          block = Proc.new { |config| expect(config).to be_a Rolis::Config }
          configure!(block)
        end
      end
    end

    def configure!(block)
      Rolis.configure(&block)
    end
  end
end
