require 'httparty'
require 'sinatra' 
require 'sinatra/reloader'
require 'pry'

get '/test' do 

 # title=blade+runner  -> empty space  become +
 @movie_title = "sdkfhdsk"
#  @movie_title = params[:title]
#  @choice = params[:choice]

 @result = HTTParty.get("http://omdbapi.com/?s=#{@movie_title}&type=#{@choice}&apikey=2f6435d9")
 # if @result.keys[1] == "Error" {

 #     return erb :movie
 # } 

 @result = @result.values[0] 


 erb :testing
end 