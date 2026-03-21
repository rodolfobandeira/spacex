require 'spec_helper'

describe SPACEX::Dragons do
  context '#info', vcr: { cassette_name: 'v4/dragons/all' } do
    subject { SPACEX::Dragons.info }
    it 'returns an array of SPACEX::Dragons' do
      expect(subject).to be_an Array
      expect(subject.first).to be_a SPACEX::Dragons
    end
  end

  context "#info('5e9d058759b1ff74a7ad5f8f')",
          vcr: { cassette_name: 'v4/dragons/one' } do
    subject { SPACEX::Dragons.info('5e9d058759b1ff74a7ad5f8f') }
    it 'returns a specific dragon' do
      expect(subject).to be_a SPACEX::Dragons
      expect(subject.id).to eq '5e9d058759b1ff74a7ad5f8f'
      expect(subject.name).not_to be_nil
    end
  end
end
