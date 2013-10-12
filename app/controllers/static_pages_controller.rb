class StaticPagesController < ApplicationController
  def home
    @post = current_user.posts.build if signed_in?
    @city = request.location.city
    gon.posts = Post.limit(10)
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
