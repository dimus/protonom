# frozen_string_literal: true

# Protonom is a namespace module
describe Protonom::Itis do
  describe '.new' do
    it 'creates new instance' do
      c = Protonom::Itis.new
      expect(c).to be_kind_of Protonom::Itis
    end
  end

  describe '#process' do
    it 'imports ITIS data' do
      res = subject.process
      expect(res).to be > 1000
    end
  end
end
