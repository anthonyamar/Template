class StaticPagesController < ApplicationController
  def home
    @passed_photos_count = Photo.passed.size
    @liked_photos_count = Photo.liked.size
  end
end
