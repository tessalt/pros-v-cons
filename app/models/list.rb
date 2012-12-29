class List < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => true

  has_many :points, dependent: :destroy, :order => 'position ASC, created_at DESC'

end
