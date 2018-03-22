require_relative './database'

class Blog
  include ::ActiveModel::Serialization
  include ::ActiveModel::Serializers::Xml
  include ::ActiveModel::Serializers::JSON
  include MongoMapper::Document

  key :first_name, String
  key :last_name, String
  key :age, Integer
  key :born_at, Time
  key :active, Boolean
  key :fav_colors, Array
end
