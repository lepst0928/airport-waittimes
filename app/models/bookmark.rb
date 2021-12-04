# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  airport_id :integer
#  user_id    :integer
#
class Bookmark < ApplicationRecord

  belongs_to(:airport, { :required => true, :class_name => "Airport", :foreign_key => "airport_id" })
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  
end
