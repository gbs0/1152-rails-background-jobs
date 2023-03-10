class GarageService < ApplicationService
  def initialize(attr = {})
    @base_url = "https://wagon-garage-api.herokuapp.com/"
    @verb = attr[:verb]
  end

  def call(attr = {})
    if @verb == "get"
      get(attr[:garage])
    elsif @verb == "post"
      post(attr[:car])
    else
      {message: "Verb Unknown"}
    end
  end

  def get(garage)
    url = "#{@base_url}/#{garage}/cars"
    request = HTTParty.get(url, headers)
    return parse(request)
  end

  def post(car)
    url = "#{@base_url}/#{car.garage}/cars"
    body = car.to_json
    request = HTTParty.post(url, body: body, headers: headers)
    return parse(request)
  end

  def headers
    {
        "Content-Type": "application/json"
    }
  end

  def parse(data)
    JSON.parse(data.body, symbolize_names: true)
  end
end