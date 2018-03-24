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

  key :dni, String, :required => true
  key :nombres, String, :required => true
  key :paterno, String, :required => true
  key :materno, String, :required => true
  key :correo, String, :required => true
  key :telefono, String, :required => true
end

class Empleado
  include ::ActiveModel::Serialization
  include ::ActiveModel::Serializers::Xml
  include ::ActiveModel::Serializers::JSON
  include MongoMapper::EmbeddedDocument

  key :empleado_id, Integer
  key :dni, String
  key :nombres, String
  key :paterno, String
  key :materno, String
  key :correo_personal, String
  key :correo_laboral, String
  key :correo_adicional, String
  key :telefono_adicional, String
  key :cargo, String
  key :telefono, String
end

class Alumno
  include ::ActiveModel::Serialization
  include ::ActiveModel::Serializers::Xml
  include ::ActiveModel::Serializers::JSON
  include MongoMapper::EmbeddedDocument

  key :alumno_id, Integer
  key :dni, String
  key :nombres, String
  key :paterno, String
  key :materno, String
  key :correo_personal, String
  key :correo_alumno, String
  key :correo_adicional, String
  key :telefono_adicional, String
  key :carrera, String
  key :telefono, String
end

class Participante
  include ::ActiveModel::Serialization
  include ::ActiveModel::Serializers::Xml
  include ::ActiveModel::Serializers::JSON
  include MongoMapper::EmbeddedDocument

  key :externo_id, ObjectId
  key :dni, String
  key :nombres, String
  key :paterno, String
  key :materno, String
  key :correo, String
  key :telefono, String
end


class ParticipanteEvento
  include ::ActiveModel::Serialization
  include ::ActiveModel::Serializers::Xml
  include ::ActiveModel::Serializers::JSON
  include MongoMapper::Document

  key :evento_id, ObjectId
  many :participantes
  many :alumnos
  many :empleados
end
