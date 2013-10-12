class StaticPagesController < ApplicationController
  def home
    @post = current_user.posts.build if signed_in?
    @city = request.location.city

    #<%@posts = Post.all %>
    #<%@posts.each do |post|%>
    #<% target = Geocoder.search(post.location) %>
    #<%if (target[0].latitude > 0 )         %>
    #    <%northSouth = "N"                  %>
    #    <%else                                 %>
    #<%  northSouth = "S"                 %>
    #    <%end%>
    #
    #    <%if (target[0].longitude > 0 )        %>
    #    <% eastWest = "E"                   %>
    #    <%else                                 %>
    #<%  eastWest = "W"                   %>
    #    <%end%>
    #    <%ll = target[0].latitude.to_s() + " " + northSouth + " " + target[0].longitude.to_s()  + " " + eastWest %>
    #
    #        postPoints["<%=post.location%>"]={"ll": "<%=ll%>" ,
    #    "country":"" ,
    #    "audio":"<%=post.audio%>" ,
    #    "name":"<%=post.user.name%>" ,
    #    "video":"<%=post.video%>" ,
    #    "comment":"<%=post.comment%>",
    #    "like":"" ,
    #    "dislike": ""  };
    #
    #<%end%>


    @posts = Post.all
    postPoints={}
    @posts.each do |post|
      target = Geocoder.search(post.location)
      if (target[0].latitude > 0 )
        northSouth = "N"
      else
        northSouth = "S"
      end

      if (target[0].longitude > 0 )
        eastWest = "E"
      else
        eastWest = "W"
      end
      ll = target[0].latitude.to_s() + " " + northSouth + " " + target[0].longitude.to_s()  + " " + eastWest
      youtube = "\<embed width='200' height='200' src='https:#{post.video}?autoplay=1' hidden='false' autoplay='ture'></embed>"

      postPoints["#{post.location}"]={"ll"=> ll ,
                                      "country"=> "" ,
                                      "audio"=> post.audio ,
                                      "name"=> post.user.name ,
                                      "video"=> youtube ,
                                      "comment"=> post.comment,
                                      "like"=> "" ,
                                      "dislike"=> ""  }


      end


    gon.postPoints = postPoints

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
