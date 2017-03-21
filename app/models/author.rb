class Author < ApplicationRecord
  include Filterable

  has_many :works, dependent: :destroy
  has_attached_file :bust, styles: { normal: "218x218>" }, default_url: "/images/plato.png"
  validates_attachment_content_type :bust, content_type: /\Aimage\/.*\z/

  scope :starts_with, -> (name) { where("name like ?", "#{name}%") }

  validates :name, presence: true
end
