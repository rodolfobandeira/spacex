module SPACEX
  module V4
    KLASS_NAMES = %w[Capsules Company Cores Crew Rockets].freeze

    KLASS_NAMES.each do |klass_name|
      SPACEX::V4.const_set(klass_name, Class.new do
        def self.info(id = nil, _query = {})
          api_name = self.to_s.gsub('SPACEX::V4::', '').downcase

          SPACEX::BaseRequest.info("#{api_name}/#{id}", nil, 'v4')
        end
      end)
    end
  end

  KLASS_NAMES = %w[History Payloads Rockets].freeze

  KLASS_NAMES.each do |klass_name|
    SPACEX.const_set(klass_name, Class.new do
      def self.info(object_id = nil, _query = {})
        api_name = self.to_s.gsub('SPACEX::', '').downcase

        SPACEX::BaseRequest.info("#{api_name}/#{object_id}")
      end
    end)
  end
end
