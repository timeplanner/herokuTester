class StaticPagesController < ApplicationController
  def home
    @post = current_user.posts.build if signed_in?
  end

  def help
  end

  def about
  end

  def about
  end
end
