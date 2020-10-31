require 'spec_helper'

describe SPACEX::BASE_URI do
  subject { SPACEX::BASE_URI }

  it 'returns the BASE URI for the SpaceX API' do
    expect(subject).to eq 'https://api.spacexdata.com'
  end
end
