class Platform < ApplicationRecord
  validates :name, :launch_year, presence: true
end
