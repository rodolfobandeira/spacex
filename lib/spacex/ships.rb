# frozen_string_literal: true

module SPACEX
  module Ships
    def self.info(index)
      if index
        SPACEX::BaseRequest.getMore('ships', index)
      else
        puts 'please insert a index'
      end
    end
  end
end