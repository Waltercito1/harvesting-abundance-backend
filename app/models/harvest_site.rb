class HarvestSite < ApplicationRecord
  belongs_to :tree
  belongs_to :location
end
