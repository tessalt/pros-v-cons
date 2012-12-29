class Point < ActiveRecord::Base
  attr_accessible :content, :pro, :weight, :list_id, :position
  belongs_to :list

  scope :ispro, where(:pro => true)
  scope :iscon, where(:pro => false)

  validates :list_id, presence: true
  validates :content, presence: true
end
