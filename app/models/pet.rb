class Pet < ActiveRecord::Base
  validates :kind, presence: true
  validates :description, presence: true, length: {minimum: 15}
end
