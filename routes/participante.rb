class MyApp < Sinatra::Base
  post '/participante/alumno/agregar' do
    data = JSON.parse(params[:data])
    evento_id = data['evento_id']
    error = false
    execption = nil
    alumno = nil
    begin
      participante_evento = ParticipanteEvento.first(
        :evento_id => BSON::ObjectId.from_string(evento_id)
      )

      alumno = {
        :alumno_id => data['id'],
        :dni => data['dni'],
        :nombres => data['nombres'],
        :paterno => data['paterno'],
        :materno => data['materno'],
        :correo_personal => data['correo_personal'],
        :correo_alumno => data['correo_alumno'],
        :telefono => data['celular'],
        :carrera => data['carrera'],
        :correo_adicional =>  data['correo_adicional'],
        :telefono_adicional => data['telefono_adicional'],
      }
      participante_evento.alumnos.push(
        Alumno.new(alumno)
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
            'Se ha registrado su participación',
          ]
        }.to_json
    else
      status 500
      return {
        :tipo_mensaje => 'error',
        :mensaje =>
          [
            'Se ha producido un error en guardar su particpación como alumno',
            execption.message
          ]
        }.to_json
    end
  end

  post '/participante/empleado/agregar' do
    data = JSON.parse(params[:data])
    evento_id = data['evento_id']
    error = false
    execption = nil
    alumno = nil
    begin
      participante_evento = ParticipanteEvento.first(
        :evento_id => BSON::ObjectId.from_string(evento_id)
      )

      empleado = {
        :empleado_id => data['id'],
        :dni => data['dni'],
        :nombres => data['nombres'],
        :paterno => data['paterno'],
        :materno => data['materno'],
        :correo_personal => data['correo_personal'],
        :correo_laboral => data['correo_laboral'],
        :telefono => data['celular'],
        :cargo => data['cargo'],
        :correo_adicional =>  data['correo_adicional'],
        :telefono_adicional => data['telefono_adicional'],
      }
      participante_evento.empleados.push(
        Empleado.new(empleado)
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
            'Se ha registrado su participación',
          ]
        }.to_json
    else
      status 500
      return {
        :tipo_mensaje => 'error',
        :mensaje =>
          [
            'Se ha producido un error en guardar su particpación como empleado',
            execption.message
          ]
        }.to_json
    end
  end

  post '/participante/externo/agregar' do
    data = JSON.parse(params[:data])
    evento_id = data['evento_id']
    error = false
    execption = nil
    alumno = nil
    begin
      participante_evento = ParticipanteEvento.first(
        :evento_id => BSON::ObjectId.from_string(evento_id)
      )
      externo = {
        :externo_id => BSON::ObjectId.from_string(data['externo_id']),
        :dni => data['dni'],
        :nombres => data['nombres'],
        :paterno => data['paterno'],
        :materno => data['materno'],
        :correo => data['correo'],
        :telefono => data['telefono'],
      }
      participante_evento.participantes.push(
        Participante.new(externo)
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
            'Se ha registrado su participación',
          ]
        }.to_json
    else
      status 500
      return {
        :tipo_mensaje => 'error',
        :mensaje =>
          [
            'Se ha producido un error en guardar su particpación como externo',
            execption.message
          ]
        }.to_json
    end
  end
end
