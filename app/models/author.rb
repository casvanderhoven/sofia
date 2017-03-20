class Author < ApplicationRecord
  include Filterable

  has_many :works
  scope :starts_with, -> (name) { where("name like ?", "#{name}%") }

  validates :name, presence: true
end
