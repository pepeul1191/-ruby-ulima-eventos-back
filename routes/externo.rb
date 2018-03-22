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
end
