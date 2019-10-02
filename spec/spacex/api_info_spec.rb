require 'spec_helper'

describe SPACEX::ApiInfo do
  context '#info', vcr: { cassette_name: 'api_info/info' } do
    subject do
      SPACEX::ApiInfo.info
    end

    it 'returns API info' do
      expect(subject.project_name).to eq 'SpaceX-API'
      expect(subject.organization).to eq 'r/SpaceX'
      expect(subject.organization_link).to eq 'https://github.com/r-spacex'
      expect(subject.description).to eq 'Open Source REST API for rocket, core, capsule, pad, and launch data, created and maintained by the developers of the r/SpaceX organization'
    end
  end
end
