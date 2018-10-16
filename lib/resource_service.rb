module ResourceService

  def hello
    puts 'hello'
  end

  def retrieve_all(resource)
    data = SPACEX::BaseRequest.call_api(resource)
    thing = data.get.body.map { |k| new(k) }
  end
end

