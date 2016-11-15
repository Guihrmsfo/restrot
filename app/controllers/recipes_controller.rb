class RecipesController < SessionController
  require 'net/http'
  layout 'admin_lte_2'
  
  APP_ID = "da2071e2"
  APP_KEY = "5dc2d144e030622c3525cf5f355d9dec"
  
  def index
  end
  
  def self.search(uri)
    uri = URI.parse("http://api.edamam.com/search?r="+uri+"&app_id="+APP_ID+"&app_key="+APP_KEY)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri)
    response = http.request(request)
    @recipe = ActiveSupport::JSON.decode(response.body)
    return @recipe.first
  end
  
  def create
  end

  def edit
  end

  def remove
  end
end
