require 'spec_helper'

describe SPACEX::History do
  context '#info', vcr: { cassette_name: 'history/info' } do
    subject do
      SPACEX::History.info
    end

    it 'returns all historical events when no id is passed' do
      first_subject = subject.first
      expect(first_subject.id).to eq 1
      expect(first_subject.title).to eq 'Falcon 1 Makes History'
      expect(first_subject.event_date_utc).to eq '2008-09-28T23:15:00Z'
      expect(first_subject.event_date_unix).to eq 1_222_643_700
      expect(first_subject.flight_number).to eq 4
      expect(first_subject.details).to eq(
        'Falcon 1 becomes the first privately '\
        'developed liquid fuel rocket to reach Earth orbit.'
      )
      expect(first_subject.links).to eq(
        'reddit' => nil,
        'article' => 'http://www.spacex.com/news/2013/02/11/flight-4-launch-update-0',
        'wikipedia' => 'https://en.wikipedia.org/wiki/Falcon_1'
      )
    end
  end

  context "#info('4')", vcr: { cassette_name: 'history/info/4' } do
    subject do
      SPACEX::History.info(4)
    end

    it 'returns Historical event info for event id 4' do
      expect(subject.id).to eq 4
      expect(subject.title).to eq 'Falcon 9 First Flight'
      expect(subject.event_date_utc).to eq '2010-06-04T18:45:00Z'
      expect(subject.event_date_unix).to eq 1_275_677_100
      expect(subject.flight_number).to eq 6
      expect(subject.details).to eq(
        'Met 100% of mission objectives on the first flight!'
      )
      expect(subject.links).to eq(
        'reddit' => nil,
        'article' => 'http://www.bbc.com/news/10209704',
        'wikipedia' =>
          'https://en.wikipedia.org/wiki/Dragon_Spacecraft_Qualification_Unit'
      )
    end
  end
end
