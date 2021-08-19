class TreeSerializer 
  include JSONAPI::Serializer

  attributes :id, :name, :description, :harvest_sites, :locations, :image_format

  attribute :image_format do |object|
   # byebug
    if object.main_image.attached?
      object.main_image.blob.attributes
            .slice('filename')
            .merge(url: object.image_url)
            .tap{ |attributes| attributes['name'] = attributes.delete('filename')}
    end
  end

  # has_many :harvest_sites
  # has_many :locations, through: :harvest_sites
end
