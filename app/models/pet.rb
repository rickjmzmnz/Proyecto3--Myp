class Pet < ActiveRecord::Base
  belongs_to :user
  validates :kind, presence: true
  validates :description, presence: true, length: {minimum: 15}
  validates :photo, presence: true

  has_attached_file :photo, styles: { small: "300x300#"}
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  def self.search(search)
    where("location LIKE ? OR kind LIKE ? OR name LIKE ? OR description LIKE ?",
          "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
