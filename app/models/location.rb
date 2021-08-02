class Location < ApplicationRecord
    has_many :harvest_sites
    has_many :trees, through: :harvest_sites
end
