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
    @choice = params[:choice]

    @result = HTTParty.get("http://omdbapi.com/?s=#{@movie_title}&type=#{@choice}&apikey=2f6435d9")
    # if @result.keys[1] == "Error" {

    #     return erb :movie
    # } 
    
    @result = @result.values[0] 


    erb :movie
end

get '/movie/:title' do
    
    # title=blade+runner  -> empty space  become +
    @movie_title = params[:title]
    # @choice = params[:choice]
    @result = HTTParty.get("http://omdbapi.com/?t=#{@movie_title}&apikey=2f6435d9")
    # if @result.keys[1] == "Error" {

    #     return erb :movie
    # } 
    
    @title = @result["Title"]
    @year = @result["Year"]
    @runtime = @result["Runtime"]
    @genre = @result["Genre"]
    @director = @result["Director"]
    @cast = @result["Actors"]
    @poster = @result["Poster"]
    @plot = @result["Plot"]

    erb :details
end
