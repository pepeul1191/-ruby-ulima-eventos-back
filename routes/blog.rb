class MyApp < Sinatra::Base
  get '/blog/listar' do
    Blog.all.to_json
  end

  get '/blog/crear' do
    blog = Blog.create({
      :first_name => 'John',
      :last_name => 'Nunemaker',
      :age => 27,
      :born_at => Time.mktime(1981, 11, 25, 2, 30),
      :active => true,
      :fav_colors => %w(red green blue)
    })
    blog.save
    blog.id.to_s
  end
end
