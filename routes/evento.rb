class MyApp < Sinatra::Base
  get '/evento/listar' do
    Evento.all.to_json
  end

  post '/evento/crear' do
    data = JSON.parse(params[:evento])
    error = false
    execption = nil
    evento = nil
    begin
      evento = Evento.create({
        :nombre => data['nombre'],
        :nombre_url => data['nombre_url'],
        :descripcion => data['descripcion'],
        :dia_inicio => data['dia_inicio'],
        :dia_fin => data['dia_fin'],
        :hora_inicio => data['hora_inicio'],
        :hora_fin => data['hora_fin'],
        :lugar => data['lugar'],
        :direccion => data['direccion'],
      })
      evento.save
      evento_id = evento.id.to_s
      participante_evento = ParticipanteEvento.create(
        :evento_id => BSON::ObjectId.from_string(evento_id),
      )
      participante_evento.save
    rescue Exception => e
      error = true
      execption = e
    end
    if error == false
      return {
        :tipo_mensaje => 'success',
        :mensaje =>
          [
            'Se ha registrado el evento',
            evento.id.to_s
          ]
        }.to_json
    else
      status 500
      return {
        :tipo_mensaje => 'error',
        :mensaje =>
          [
            'Se ha producido un error en guardar el nuevo evento',
            execption.message
          ]
        }.to_json
    end
  end

  post '/evento/editar' do
    data = JSON.parse(params[:evento])
    error = false
    execption = nil
    evento = nil
    begin
      evento = Evento.find(BSON::ObjectId.from_string(data['_id']))
      evento.nombre = data['nombre']
      evento.nombre_url = data['nombre_url']
      evento.descripcion = data['descripcion']
      evento.dia_inicio = data['dia_inicio']
      evento.dia_fin = data['dia_fin']
      evento.hora_inicio = data['hora_inicio']
      evento.hora_fin = data['hora_fin']
      evento.lugar = data['lugar']
      evento.direccion = data['direccion']
      evento.save
    rescue Exception => e
      error = true
      execption = e
    end
    if error == false
      return {
        :tipo_mensaje => 'success',
        :mensaje =>
          [
            'Se ha editado el evento'
          ]
        }.to_json
    else
      status 500
      return {
        :tipo_mensaje => 'error',
        :mensaje =>
          [
            'Se ha producido un error en guardar el evento editado',
            execption.message
          ]
        }.to_json
    end
  end

  get '/evento/nombre_url' do
    nombre_url = params[:nombre_url]
    error = false
    execption = nil
    evento = nil
    begin
      evento = Evento.first(
        :nombre_url => nombre_url
      )
    rescue Exception => e
      error = true
      execption = e
    end
    if error == false
      return evento.to_json
    else
      status 500
      return {
        :tipo_mensaje => 'error',
        :mensaje =>
          [
            'Se ha producido un error en Obtener el evento por su nombre_url',
            execption.message
          ]
        }.to_json
    end
  end

  get '/evento/_id/:_id' do
    _id = params[:_id]
    error = false
    execption = nil
    evento = nil
    begin
      evento = Evento.find(BSON::ObjectId.from_string(_id))
    rescue Exception => e
      error = true
      execption = e
    end
    if error == false
      return evento.to_json
    else
      status 500
      return {
        :tipo_mensaje => 'error',
        :mensaje =>
          [
            'Se ha producido un error en obtener el evento por su _id',
            execption.message
          ]
        }.to_json
    end
  end

  post '/evento/guardar' do
   data = JSON.parse(params[:data])
   eliminados = data['eliminados']
   rpta = []
   array_nuevos = []
   error = false
   execption = nil
   begin
     if eliminados.length != 0
       Evento.destroy(eliminados)
     end
   rescue Exception => e
     error = true
     execption = e
   end
   if error == false
     return  {
       :tipo_mensaje => 'success',
       :mensaje =>
          [
            'Se ha registrado los cambios en los eventos',
            array_nuevos
          ]
      }.to_json
   else
     status 500
     return {
       :tipo_mensaje => 'error',
       :mensaje =>
         [
           'Se ha producido un error en guardar la tabla de eventos',
           execption.message
         ]
       }.to_json
   end
 end

 get '/evento/participantes/:evento_id' do
   evento_id = params[:evento_id]
   error = false
   execption = nil
   evento = nil
   begin
     participantes = ParticipanteEvento.where(:evento_id => BSON::ObjectId.from_string(evento_id)).first
   rescue Exception => e
     error = true
     execption = e
   end
   if error == false
     return participantes.to_json
   else
     status 500
     return {
       :tipo_mensaje => 'error',
       :mensaje =>
         [
           'Se ha producido un error en obtener los participantes del evento',
           execption.message
         ]
       }.to_json
   end
 end
end
