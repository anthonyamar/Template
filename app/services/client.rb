require "json"
require "pry"
require "rest-client"

class Client
  
  URL = "https://api.gotinder.com"
  
  def initialize
    #binding.pry
  end
  
  def nearby_persons
    endpoint = "/v2/recs/core"
    get(URL + endpoint)
  end
  
  def profile
    endpoint = "/v2/profile?include=account%2Cuser"
    get(URL + endpoint)
  end
  
  def matches
    endpoint = "/v2/matches"
    get(URL + endpoint)
  end
  
  def like(user_id)
    endpoint = "/like/#{user_id}"
    get(URL + endpoint)
  end
  
  def dislike(user_id)
    endpoint = "/pass/#{user_id}"
    get(URL + endpoint)
  end
  
  private
   
  def headers
    {
      "X-Auth-Token": "739fde33-f3cf-484c-a521-af1e7ca5453b",
      "Content-Type": "application/json",
    }
  end

  def post(url, params)
    RestClient.post(url, params.to_json, headers)
  end
  
  def get(url)
    RestClient.get(url, headers)
  end
  
end

Client.new