class StaticPagesController < ApplicationController
  def home
    @post = current_user.posts.build if signed_in?
    @city = request.location.city

  end

  def help
  end

  def about
  end

  def about
  end

  def checkLocation

  end
end
