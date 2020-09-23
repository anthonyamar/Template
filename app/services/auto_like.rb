require "pp"
require "json"
require "pry"
require_relative "client.rb"

class AutoLike
  
  attr_reader :client
  
  def initialize
    @client = Client.new
  end
  
  def perform
    results = get_profiles_nearby
    like_profiles(results)
  end
  
  private
  
  def get_profiles_nearby
    payload = client.nearby_persons
    json = JSON.parse(payload.body)
    json["data"]["results"]
  end
  
  def like_profiles(results)
    swiped = []
    results.each do |user|
      time_between_next_swipe = rand(1..10).round(2)
      user_id = user["user"]["_id"]
      name = user["user"]["name"]
      onward_photo_url = user["user"]["photos"].first["url"]
      age = DateTime.now.year - DateTime.parse(user["user"]["birth_date"]).year
      hash = { id: user_id, name: name, photo: onward_photo_url, age: age }
      swiped << hash
      pp hash
      puts "wait #{time_between_next_swipe} seconds..."
      sleep(time_between_next_swipe)
    end
  end
  
end

AutoLike.new.perform