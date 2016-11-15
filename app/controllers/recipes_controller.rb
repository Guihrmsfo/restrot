class RecipesController < SessionController
  require 'net/http'
  layout 'admin_lte_2'
  
  APP_ID = "da2071e2"
  APP_KEY = "5dc2d144e030622c3525cf5f355d9dec"
  
  def index
    query = "chicken%20beer%20olive%20avocado"
    uri = URI.parse("http://api.edamam.com/search?q="+query+"&app_id="+APP_ID+"&app_key="+APP_KEY+"&from=0&to=30")
    http = Net::HTTP.new(uri.host, uri.port)

    request = Net::HTTP::Post.new(uri.request_uri)

    response = http.request(request)
    resultado = JSON.parse(response.body)
    
    if resultado.empty?
      @receitasTotais = []
    else
      receita_atual = {}
      ingrediente_atual = {}
      ingredientes_totais_receita_atual = []
      @receitasTotais = []
      
      resultado['hits'].each do |receita|
        contador_ingredientes = 0
        receita['recipe']['ingredients'].each do |ingrediente|
          ingrediente_atual = {text: ingrediente['text'], quantity: ingrediente['quantity'], measure: ingrediente['measure']}
          ingredientes_totais_receita_atual.push(ingrediente_atual)
          contador_ingredientes += 1
        end  
        
        receita_atual = {
          image: receita['recipe']['image'], 
          name: receita['recipe']['label'],
          calories: receita['recipe']['calories'].to_i,
          uri: receita['recipe']['uri'],
          url: receita['recipe']['url'],
          ingredients_count: contador_ingredientes,
          ingredients: ingredientes_totais_receita_atual  
        }
        
        contador_ingredientes = 0
        @receitasTotais.push(receita_atual)
        
      end
    end
  end
  
  def create
  end

  def edit
  end

  def remove
  end
end
