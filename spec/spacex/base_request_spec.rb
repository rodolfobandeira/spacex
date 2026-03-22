require 'spec_helper'

describe SPACEX::BaseRequest do
  describe 'BASE_URI' do
    it 'points to the SpaceX v4 API' do
      expect(SPACEX::BASE_URI).to eq 'https://api.spacexdata.com'
    end
  end

  describe '.info' do
    context 'when the response body is an array' do
      before do
        stub_request(:get, 'https://api.spacexdata.com/v4/capsules')
          .to_return(
            status: 200,
            body: '[{"id":"abc","serial":"C101"},{"id":"def","serial":"C102"}]',
            headers: { 'Content-Type' => 'application/json' }
          )
      end

      it 'returns an array of SPACEX::Response objects' do
        result = SPACEX::BaseRequest.info('capsules')
        expect(result).to be_an Array
        expect(result.length).to eq 2
        expect(result.first).to be_a SPACEX::Response
      end

      it 'maps response fields onto each element' do
        result = SPACEX::BaseRequest.info('capsules')
        expect(result.first.id).to eq 'abc'
        expect(result.last.serial).to eq 'C102'
      end

      context 'when a klass is provided' do
        it 'wraps each element in the given class' do
          result = SPACEX::BaseRequest.info('capsules', SPACEX::Capsules)
          expect(result).to be_an Array
          expect(result.first).to be_a SPACEX::Capsules
        end
      end
    end

    context 'when the response body is a single object' do
      before do
        stub_request(:get, 'https://api.spacexdata.com/v4/company')
          .to_return(
            status: 200,
            body: '{"id":"spacex","name":"SpaceX"}',
            headers: { 'Content-Type' => 'application/json' }
          )
      end

      it 'returns a single SPACEX::Response' do
        result = SPACEX::BaseRequest.info('company')
        expect(result).to be_a SPACEX::Response
      end

      it 'maps response fields' do
        result = SPACEX::BaseRequest.info('company')
        expect(result.id).to eq 'spacex'
        expect(result.name).to eq 'SpaceX'
      end

      context 'when a klass is provided' do
        it 'returns an instance of the given class' do
          result = SPACEX::BaseRequest.info('company', SPACEX::Capsules)
          expect(result).to be_a SPACEX::Capsules
        end
      end
    end

    context 'when the API returns a 404' do
      before do
        stub_request(:get, 'https://api.spacexdata.com/v4/capsules/unknown-id')
          .to_return(status: 404, body: '', headers: {})
      end

      it 'raises Faraday::ResourceNotFound' do
        expect { SPACEX::BaseRequest.info('capsules/unknown-id') }
          .to raise_error(Faraday::ResourceNotFound)
      end
    end

    context 'when the API returns a 500' do
      before do
        stub_request(:get, 'https://api.spacexdata.com/v4/capsules')
          .to_return(status: 500, body: '', headers: {})
      end

      it 'raises Faraday::ServerError' do
        expect { SPACEX::BaseRequest.info('capsules') }
          .to raise_error(Faraday::ServerError)
      end
    end
  end

  describe 'SPACEX::Response' do
    it 'is a Hashie::Mash' do
      expect(SPACEX::Response.new).to be_a Hashie::Mash
    end

    it 'silently ignores unknown properties' do
      expect { SPACEX::Response.new(unknown_field: 'value') }.not_to raise_error
    end

    it 'provides access to properties' do
      response = SPACEX::Response.new('id' => 'abc', 'name' => 'test')
      expect(response.id).to eq 'abc'
      expect(response.name).to eq 'test'
    end
  end
end
