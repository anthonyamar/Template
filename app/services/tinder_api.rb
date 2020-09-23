class TinderApi
  
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
      "X-Auth-Token": ENV["tinder_x_auth_token"],
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