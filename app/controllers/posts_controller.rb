class PostsController < ApplicationController
  before_filter :signed_in_user

  def create
    @post = current_user.posts.build(params[:post])
    if Geocoder.search(@post.location).respond_to?"address"
      @post.location =( Geocoder.search(@post.location))[0].address
    end
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end


end