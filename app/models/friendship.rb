class Friendship < ActiveRecord::Base
  belongs_to :user, :class_name => 'User', :primary_key => 'beamer_id', :foreign_key =>'beamer_id'
  belongs_to :friend, :class_name => 'User', :primary_key => 'beamer_id', :foreign_key =>'friend_beamer_id'
end
