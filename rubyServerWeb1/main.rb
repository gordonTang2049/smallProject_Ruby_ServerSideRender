require 'sinatra' 
require 'sinatra/reloader'
require 'pry'


get '/' do
    @number_of_beer = 99
    erb :home
end 


# /:client_name
# 5-6

# Form would only goes to query string
# Means only go to the route |
#                            V + query string ? xyz=  abc=

get '/home' do
    
    # @number_of_beer = 99
    @client_name = params[:client_name]
    @number_of_beer = params[:number_of_beer].to_i
    # @number_of_beer = @number_of_beer.to_i
    @order = params[:order].to_i

    @number_of_beer += @order
   
    
    # If I ever -1 here, I would return the pre-minus one beer number
    # @number_of_beer -= 1 
    
    erb :home
end 

# Variable process in HTML Would go down
# <a href="/home/<%= @number_of_beer -= 1 %>"> Click me </a>
# For pretty URL route must have the Variable for them to pass
                        # | this route
                        # V

get '/home/:number_of_beer/:client_name' do
    # @client_name = params[:client_name]
    @number_of_beer = params[:number_of_beer].to_i
    @client_name = params[:client_name]
    erb :home
end

get '/home/0' do
    # @client_name = params[:client_name]
    @number_of_beer = "No more beer"
    
    erb :no_beer
end

# get '/home/:number_of_beer/:client_name' do
    
#     @client_name = params[:client_name]
#     @number_of_beer = params[:number_of_beer]
#     @number_of_beer = @number_of_beer.to_i  
#     # @number_of_beer = 99
#     # @number_of_beer = @number_of_beer.to_i    
#     # @number_of_beer -= 1
#     # @number_of_beer.to_s

#     erb :home
# end 