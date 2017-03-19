class Work < ApplicationRecord
  belongs_to :author
  has_many :chapters

  validates :name, presence: true
end
