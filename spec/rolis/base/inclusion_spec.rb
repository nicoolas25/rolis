Rspec.describe Rolis::Base do
  let(:klass) { rolis_based_class }

  describe "a class including Rolis::Base" do
    subject { klass }
    it { is_expected.to respond_to(:rolis) }
    it { is_expected.to respond_to(:rolis_config) }

    describe "#rolis" do
      subject(:rolis_call) { klass.rolis }

      context "#rolis_config has not been done" do
        it "raises an error" do
          expect { rolis_call }.to raise_error
        end
      end

      context "#rolis_config has been done" do
        it { is_expected.to be_a Rolis::Client }
      end
    end

    describe "#rolis_config" do
      context "no argument are given" do
        subject { klass.rolis_config }

        context "no prior #rolis_config had been made" do
          it { is_expected.to be_nil }
        end

        context "a prior call to #rolis_config had been made" do
          before { klass.rolis_config %i(slave master) }
          it { is_expected.to be_a Rolis::ClientConfig }
        end
      end

      xit "takes a list of symbols" do
      end
    end
  end

  describe "an instance of a class including Rolis::Base" do
    subject(:instance) { klass.new(35) }
    it { is_expected.to respond_to(:has_role?) }
  end
end
