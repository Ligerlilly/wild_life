class Sighting < ActiveRecord::Base
  belongs_to :species
  belongs_to :region
  validates :lat, presence: true
  validates :long, presence: true
  validates :date, presence: true

end
