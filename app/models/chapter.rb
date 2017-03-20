class Chapter < ApplicationRecord
  belongs_to :work
  has_many :sections, dependent: :destroy
end
