class FriendsController < ApplicationController

  def following
    @user = User.find(params[:beamer_id])
    @following = @user.friends
  end

  def index
    @user = User.find(params[:beamer_id])
    @following = @user.friends
    @followers = Friendship.find(:all, :conditions => {:friend_beamer_id => @user.beamer_id}, :include => :user)
  end
  
  def followers
   @user = User.find(params[:beamer_id])
   @followers = Friendship.find(:all, :conditions => {:friend_beamer_id => @user.beamer_id}, :include => :user )
 end

 def show
  redirect_to root_url
end

def new
  @friendship = Friendship.new
end

def create
  @user = current_user
  @friend = User.find(params[:beamer_id])
  params[:friendship] = {:beamer_id => @user.beamer_id, :friend_beamer_id => @friend.beamer_id }
  @friendship = Friendship.create(params[:friendship])
  if @friendship.save
    #Notification.create(:user_id=>@friend.id, :notification_type=>"follower", :object_id=>@user.id)
    redirect_to :back
  else
    redirect_to root_url
  end
end

def destroy
  @user = User.find(params[:beamer_id])
  @friend = User.find(params[:friend_beamer_id])
  @friendship = @user.friendships.find_by_friend_beamer_id(params[:friend_beamer_id]).destroy
  redirect_to :back
end

end
