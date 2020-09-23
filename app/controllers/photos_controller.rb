class PhotosController < ApplicationController
  
  def index
    json_object = JSON.parse(TinderApi.new.nearby_persons, object_class: OpenStruct)
    @tinder_profile = json_object.data.results.first
  end
  
  def create
    
  end
  
end
