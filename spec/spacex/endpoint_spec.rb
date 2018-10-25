require 'spec_helper'

describe SPACEX::ENDPOINT_URI do
  subject { SPACEX::ENDPOINT_URI }

  it 'returns the URI for v3 of the SpaceX API' do
    expect(subject).to eq 'https://api.spacexdata.com/v3'
  end
end
