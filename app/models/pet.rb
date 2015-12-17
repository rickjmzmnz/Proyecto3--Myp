class Pet < ActiveRecord::Base
  belongs_to :user

  validates :kind, presence: true
  validates :description, presence: true, length: {minimum: 15}

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end  
end
