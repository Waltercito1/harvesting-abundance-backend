class TreeSerializer
  include JSONAPI::Serializer

  attributes :id, :name, :description, :harvest_sites, :locations, through: :harvest_sites, :main_image_format

  def main_image_format
    return unless object.main_image.attached?
byebug
    object.main_image.blob.attributes
      .slice('filename', 'byte_size')
      .merge(url: object.image_url)
      .tap { |attrs| attrs['name'] = attrs.delete('filename') }
  end

  # has_many :harvest_sites
  # has_many :locations, through: :harvest_sites
end
