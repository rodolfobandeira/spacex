module ResourceService
  def retrieve_all(resource)
    data = SPACEX::BaseRequest.call_api(resource)
    data.get.body.map { |k| new(k) }
  end
end
