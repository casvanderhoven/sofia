class Work < ApplicationRecord
  belongs_to :author
  has_many :chapters, dependent: :destroy

  validates :name, presence: true
end
