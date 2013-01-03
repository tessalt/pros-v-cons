class List < ActiveRecord::Base
  attr_accessible :name
  before_create :randomize_id

  validates :name, :presence => true

  has_many :points, dependent: :destroy, :order => 'position ASC, created_at DESC'

  private
  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000)
    end while List.where(:id => self.id).exists?
  end    

end
