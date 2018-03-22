class MyApp < Sinatra::Base
  get '/externo/listar' do
    Externo.all.to_json
  end

  post '/externo/crear' do
    data = JSON.parse(params[:externo])
    error = false
    execption = nil
    externo = nil
    begin
      externo = Externo.create({
        :dni => data['dni'],
        :nombres => data['nombres'],
        :paterno => data['paterno'],
        :materno => data['materno'],
        :correo => data['correo'],
        :telefono => data['telefono'],
      })
      externo.save
    rescue Exception => e
      error = true
      execption = e
    end
    if error == false
      return {
        :tipo_mensaje => 'success',
        :mensaje =>
          [
            'Se ha registrado al participante externo',
            externo.id.to_s
          ]
        }.to_json
    else
      status 500
      return {
        :tipo_mensaje => 'error',
        :mensaje =>
          [
            'Se ha producido un error en guardar el nuevo participante externo',
            execption.message
          ]
        }.to_json
    end
  end

  post '/externo/editar' do
    data = JSON.parse(params[:externo])
    error = false
    execption = nil
    externo = nil
    begin
      externo = Externo.find(BSON::ObjectId.from_string(data['_id']))
      externo.dni = data['dni']
      externo.nombres = data['nombres']
      externo.paterno = data['paterno']
      externo.materno = data['materno']
      externo.correo = data['correo']
      externo.telefono = data['telefono']
      externo.save
    rescue Exception => e
      error = true
      execption = e
    end
    if error == false
      return {
        :tipo_mensaje => 'success',
        :mensaje =>
          [
            'Se ha editado el participante externo'
          ]
        }.to_json
    else
      status 500
      return {
        :tipo_mensaje => 'error',
        :mensaje =>
          [
            'Se ha producido un error en guardar al participante externo editado',
            execption.message
          ]
        }.to_json
    end
  end

  post '/externo/guardar' do
   data = JSON.parse(params[:data])
   eliminados = data['eliminados']
   rpta = []
   array_nuevos = []
   error = false
   execption = nil
   begin
     if eliminados.length != 0
       Externo.destroy(eliminados)
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
            'Se ha registrado los cambios en los participantes externos',
            array_nuevos
          ]
      }.to_json
   else
     status 500
     return {
       :tipo_mensaje => 'error',
       :mensaje =>
         [
           'Se ha producido un error en guardar la tabla de participantes externos',
           execption.message
         ]
       }.to_json
   end
 end
end
