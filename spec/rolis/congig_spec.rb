RSpec.describe Rolis::Config do
  subject(:instance) { described_class.new }

  describe "#redis=" do
    it { is_expected.to respond_to(:redis=) }

    context "the given argument isn't a Redis instance" do
      it "raises an ArgumentError" do
        expect { instance.redis = :foo }.to raise_error(ArgumentError)
      end
    end

    context "the given argument is a Redis instance" do
      let(:redis) { instance_double(Redis) }

      it "sets the redis property of the Config instance" do
        expect { instance.redis = redis }.
          to change { instance.redis }.
          from(nil).to(redis)
      end
    end
  end
end
