class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_many :photos, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :bio, allow_blank: true, length: { maximum: 500 }

  def self.order_by_name
    order :first_name
  end

end
