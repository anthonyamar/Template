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
        format.json { head :ok }
      end
    end
  end
  
  def swipe_right
    client = TinderApi.new
    response = client.like(params[:tinder_id])
    
    if response.code == 200
      redirect_to photos_path
      flash[:success] = "Swipe right :-)"
    else
      redirect_to photos_path
      flash[:danger] = response
    end
  end
  
  def swipe_left
    client = TinderApi.new
    response = client.dislike(params[:tinder_id])
    
    if response.code == 200
      redirect_to photos_path
      flash[:success] = "Swipe left :-("
    else
      redirect_to photos_path
      flash[:danger] = response
    end
  end

  private
  
  def photo_params
    params.require(:photo).permit(:url, :label, :user_id)
  end

end
