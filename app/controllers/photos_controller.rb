class PhotosController < ApplicationController

  def index
    json_object = JSON.parse(TinderApi.new.nearby_persons, object_class: OpenStruct)
    @tinder_profile = json_object.data.results.first
  end

  def create
    @photo = Photo.new(photo_params)
    
    if @photo.save!
      respond_to do |format|
        format.json { head :ok }
      end
    else
      respond_to do |format|
        puts "+=======================+"
        puts "failed"
        puts "+=======================+"
        format.json { head :ok }
      end
    end
  end

  private
  
  def photo_params
    params.require(:photo).permit(:url, :label, :user_id)
  end

end
