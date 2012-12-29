# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class List < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => true

  has_many :points, dependent: :destroy, order: 'position asc'
  
end
