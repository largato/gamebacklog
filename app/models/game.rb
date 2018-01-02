class Game < ApplicationRecord
  belongs_to :platform
  validates :name, presence: true
end
