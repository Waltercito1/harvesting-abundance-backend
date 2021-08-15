class Location < ApplicationRecord
    validates :latitude, presence: true
    validates :longitude, presence: true

    has_many :harvest_sites
    has_many :trees, through: :harvest_sites
end
