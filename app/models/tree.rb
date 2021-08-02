class Tree < ApplicationRecord
    has_many :harvest_sites
    has_many :locations, through: :harvest_sites
end
