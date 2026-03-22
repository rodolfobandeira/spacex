require 'spec_helper'

describe SPACEX::VERSION do
  it 'has a version' do
    expect(SPACEX::VERSION).to_not be nil
  end

  it 'is a semantic version string' do
    expect(SPACEX::VERSION).to match(/\A\d+\.\d+\.\d+\z/)
  end
end

describe SPACEX do
  describe '.help' do
    it 'prints the GitHub URL' do
      expect { SPACEX.help }.to output("https://github.com/rodolfobandeira/spacex\n").to_stdout
    end
  end
end
