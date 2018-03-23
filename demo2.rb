require_relative 'config/database'
require_relative 'config/models'

data = {
  :nombre => 'Biopolímero a partir del almidón de papa',
  :nombre_url => 'biopolimero-a-partir-del-almidón-de-papa',
  :descripcion => '<h1>titulo</h1><p>hola</br>mundo</p>',
  :dia_inicio => '22/07/2015',
  :dia_fin => '25/07/2015',
  :hora_inicio => '14.00',
  :hora_fin => '16:00',
  :lugar => 'Auditorio Edificio S',
  :direccion => 'Avenida Javier Prado Este N.° 4600, Santiago de Surco, Lima, Perú '
}

"""
evento = Evento.create({
  :nombre => data[:nombre],
  :nombre_url => data[:nombre_url],
  :descripcion => data[:descripcion],
  :dia_inicio => data[:dia_inicio],
  :dia_fin => data[:dia_fin],
  :hora_inicio => data[:hora_inicio],
  :hora_fin => data[:hora_fin],
  :lugar => data[:lugar],
  :direccion => data[:direccion],
})
evento.save
"""

participante_data_1 = {
  :dni => '70232385',
  :nombres => 'Carlos Alberto',
  :paterno => 'Tevez x',
  :materno => 'Martinez',
  :correo => 'carlitos@cabj.ar',
  :telefono => '819234-12312',
  :procedencia => 'externo',
}

participante_data_2 = {
  :dni => '70232385',
  :nombres => 'Carlos',
  :paterno => 'Tevez',
  :materno => 'Chao',
  :correo => 'carlitos@uni.pe',
  :telefono => '819234-12312',
  :procedencia => 'externo',
}

participante_evento = ParticipanteEvento.create(
  :participantes => [
    Participante.new(participante_data_1),
    Participante.new(participante_data_2),
  ]
)
participante_evento.save
