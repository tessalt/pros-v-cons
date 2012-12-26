class Point < ActiveRecord::Base
  attr_accessible :content, :list_id, :position, :pro, :weight
  belongs_to :list

  scope :ispro, where(:pro => true)
  scope :iscon, where(:pro => false)

  validates :list_id, presence: true
  validates :content, presence: true
end
