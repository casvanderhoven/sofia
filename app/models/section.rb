class Section < ApplicationRecord
  extend FriendlyId

  belongs_to :chapter
end
