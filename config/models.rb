require_relative './database'

class Blog
  include ::ActiveModel::Serialization
  include ::ActiveModel::Serializers::Xml
  include ::ActiveModel::Serializers::JSON
  include MongoMapper::Document
  include MongoMapper::EmbeddedDocument

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
  key :hora_inicio, String, :required => true
  key :hora_fin, String, :required => true
  key :lugar, String, :required => true
  key :direccion, String, :required => true
end

class Externo
  include ::ActiveModel::Serialization
  include ::ActiveModel::Serializers::Xml
  include ::ActiveModel::Serializers::JSON
  include MongoMapper::Document
  include MongoMapper::EmbeddedDocument

  key :dni, String, :required => true
  key :nombres, String, :required => true
  key :paterno, String, :required => true
  key :materno, String, :required => true
  key :correo, String, :required => true
  key :telefono, String, :required => true
end

class Participante
  include ::ActiveModel::Serialization
  include ::ActiveModel::Serializers::Xml
  include ::ActiveModel::Serializers::JSON
  include MongoMapper::EmbeddedDocument

  key :dni, String
  key :nombres, String
  key :paterno, String
  key :materno, String
  key :correo, String
  key :telefono, String
  key :procedencia, String
end

class ParticipanteEvento
  include ::ActiveModel::Serialization
  include ::ActiveModel::Serializers::Xml
  include ::ActiveModel::Serializers::JSON
  include MongoMapper::Document

  many :participantes
end
