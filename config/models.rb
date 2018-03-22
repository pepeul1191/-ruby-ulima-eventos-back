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

class Evento
  include ::ActiveModel::Serialization
  include ::ActiveModel::Serializers::Xml
  include ::ActiveModel::Serializers::JSON
  include MongoMapper::Document

  key :nombre, String, :required => true
  key :nombre_url, String, :required => true
  key :descripcion, String, :required => true
  key :dia_inicio, Time, :required => true
  key :dia_fin, Time, :required => true
  key :hora_inicio, Time, :required => true
  key :hora_fin, Time, :required => true
  key :lugar, String, :required => true
  key :direccion, String, :required => true
end
