require_relative 'config/database'
require_relative 'config/models'

evento_id = '5aba4140ef09511cec000001'
#evento_id = '5aba4140ef09511cec000002'
participantes = ParticipanteEvento.where(:evento_id => BSON::ObjectId.from_string(evento_id)).first
puts participantes.to_json
