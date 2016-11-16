def rolis_based_class
  Class.new(Struct.new(:id)).tap do |klass|
    include described_class
  end
end
