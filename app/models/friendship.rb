class Friendship < ActiveRecord::Base
  attr_accessible :beamer_id,:friend_beamer_id
  belongs_to :user, :class_name => 'User', :primary_key => 'beamer_id', :foreign_key =>'beamer_id'
  belongs_to :friend, :class_name => 'User', :primary_key => 'beamer_id', :foreign_key =>'friend_beamer_id'
end
