class Chapter < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :work
  has_many :sections, dependent: :destroy
end
