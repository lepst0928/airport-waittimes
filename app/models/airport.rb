# == Schema Information
#
# Table name: airports
#
#  id         :integer          not null, primary key
#  city       :string
#  code       :string
#  lat        :float, removed
#  long       :float, removed
#  name       :string
#  state      :string
#  waittime   :time
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Airport < ApplicationRecord

  has_many(:bookmarks, { :class_name => "Bookmark", :foreign_key => "airport_id", :dependent => :destroy })

end
