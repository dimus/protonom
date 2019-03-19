# frozen_string_literal: true

# Protonom is a namespace module
describe Protonom::Client do
  let(:subject) { Protonom::Client.new }

  describe '.new' do
    it 'creates new instance' do
      c = Protonom::Client.new
      expect(c).to be_kind_of Protonom::Client
    end
  end

  describe '#version' do
    it 'returns version' do
      ver = subject.version
      expect(ver.value).to match(/^v\d/)
    end
  end
end
