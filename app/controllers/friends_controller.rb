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

  def pending_confirm_requests
    @user=current_user
    @confirm_requests=Friendship.find(:all,:conditions=>{:requested_to=>@user.beamer_id,:status=>"waiting"},:include=>:user)
  end

  def pending_sent_requests
    @user=current_user
    @sent_requests=Friendship.find(:all,:conditions=>{:beamer_id=>@user.beamer_id,:status=>"waiting"},:include=>:user)
  end

  def friends
  end

 def show
  redirect_to root_url
end

def new
  @friendship = Friendship.new
end

def create
  @user = current_user
  @friend = User.find_by_beamer_id(params[:beamer_id])
  params[:friendship] = {:beamer_id => @user.beamer_id, :friend_beamer_id => @friend.beamer_id }
  @friendship = Friendship.create(params[:friendship])
  @friendship.status="waiting"
  @friendship.requested_to=@friend.beamer_id
  if @friendship.save
    #Notification.create(:user_id=>@friend.id, :notification_type=>"follower", :object_id=>@user.id)
    redirect_to :back
  else
    redirect_to :back
  end
end

def confirmm_friendship

end

def destroy
  @user = User.find_by_beamer_id(params[:beamer_id])
  @friend = User.find_by_beamer_id(params[:friend_beamer_id])
  raise "#{@user.first_name}  #{@friend.first_name}"
  @friendship = @user.friendships.find_by_friend_beamer_id(params[:friend_beamer_id]).destroy
  redirect_to :back
end

end
