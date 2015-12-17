class Pet < ActiveRecord::Base
  belongs_to :user

  validates :kind, presence: true
  validates :description, presence: true, length: {minimum: 15}

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
    where("kind LIKE ?", "%#{search}%")
    where("location LIKE ?", "%#{search}%")
  end  
end
