class TreeSerializer 
  include JSONAPI::Serializer

  attributes :id, :name, :description, :harvest_sites, :locations, :users

  attribute :image_format do |object|

    if object.main_image.attached?
      object.main_image.blob.attributes
            .slice('filename')
            .merge(url: object.image_url)
            .tap{ |attributes| attributes['name'] = attributes.delete('filename')}
    end
  end
end
