require 'httparty'
require 'sinatra' 
require 'sinatra/reloader'
require 'pry'


# ENV key before I push to github
# movie name space-> "-"" -> spider-man

get '/' do
    
    erb :index
end 

get '/movie' do

    # title=blade+runner  -> empty space  become +
    @movie_title = params[:title]
    @result = HTTParty.get("http://omdbapi.com/?s=#{@movie_title}& &apikey=2f6435d9")
    
    erb :movie
end
