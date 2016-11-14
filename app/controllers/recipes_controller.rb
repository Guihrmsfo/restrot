class RecipesController < SessionController
  require 'net/http'
  def index
    uri = URI.parse("http://api.edamam.com/search?q=chicken%20beer%20olive%20avocado&app_id=da2071e2&app_key=5dc2d144e030622c3525cf5f355d9dec")
    http = Net::HTTP.new(uri.host, uri.port)

    request = Net::HTTP::Post.new(uri.request_uri)
    request.set_form_data({"user[name]" => "testusername", "user[email]" => "testemail@yahoo.com"})

    response = http.request(request)
    render :json => response.body
    
  end
  
  def create
  end

  def edit
  end

  def remove
  end
end
