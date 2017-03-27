class Work < ApplicationRecord
  belongs_to :author
  has_many :chapters, dependent: :destroy
  has_many :articles, dependent: :destroy

  validates :name, presence: true
end
