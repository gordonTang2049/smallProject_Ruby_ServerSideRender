# require 'httparty'
# # require 'sinatra' 
# # require 'sinatra/reloader'
# require 'pry'

# # get '/test' do 

#  # title=blade+runner  -> empty space  become +
# @movie_title = "sdkfhdsk"
# #  @movie_title = params[:title]
# #  @choice = params[:choice]

# @result = HTTParty.get("http://omdbapi.com/?t=jaws&apikey=2f6435d9")

# #  @result = HTTParty.get("http://omdbapi.com/?s=#{@movie_title}&type=#{@choice}&apikey=2f6435d9")
#  # if @result.keys[1] == "Error" {

#  #     return erb :movie
#  # } 

# #  @result = @result.keys[0] 


# key =  @result.keys
# # print key
# value =  @result.values
# print value

# file = File.open("HaveALook.txt","w")
# file.write(key)
# file.write(value)
# file.close

    


# # 
# # erb :testingend 


# ["Jaws", 
#     "1975", 
#     "PG", 
#     "20 Jun 1975",
#      "124 min", 
#      "Adventure, Drama, Thriller", 
#      "Steven Spielberg",
#       "Peter Benchley (screenplay),Carl Gottlieb (screenplay),Peter Benchley (based on the novel by)", 
#         "Roy Scheider, Robert Shaw, Richard Dreyfuss, Lorraine Gary", 
#         "When a killer shark unleashes chaos on a beach community, it's up to a local sheriff, a marine biologist, and an old seafarer to hunt the beast down.", 
#         "English", 
#         "USA", 
#         "Won 3 Oscars. Another 11 wins & 19 nominations.",
# "https://m.media-amazon.com/images/M/MV5BMmVmODY1MzEtYTMwZC00MzNhLWFkNDMtZjAwM2EwODUxZTA5XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg",
#    --Ratings
# [{"Source"=>"Internet Movie Database", "Value"=>"8.0/10"}, 
# {"Source"=>"Rotten Tomatoes", "Value"=>"98%"}, 
# {"Source"=>"Metacritic", "Value"=>"87/100"}], 

# "87", 
# "8.0", 
# "521,717", 
# "tt0073195", 
# "movie", 
# "11 Jul 2000", 
# "N/A", 
# "Universal Pictures", 
# "N/A", 
# "True"]


insert into omdb (name, image_url, dob, year_of_joining, year_of_leaving) 


value = ["Jaws", "1975", "PG", "20 Jun 1975", "124 min", "Adventure, Drama, Thriller", "Steven Spielberg", "Peter Benchley (screenplay), Carl Gottlieb (screenplay), Peter Benchley (based on the novel by)", "Roy Scheider, Robert Shaw, Richard Dreyfuss, Lorraine Gary", "When a killer shark unleashes chaos on a beach community, it's up to a local sheriff, a marine biologist, and an old seafarer to hunt the beast down.", "English", "USA", "Won 3 Oscars. Another 11 wins & 19 nominations.",
    "https://m.media-amazon.com/images/M/MV5BMmVmODY1MzEtYTMwZC00MzNhLWFkNDMtZjAwM2EwODUxZTA5XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg",[{"Source"=>"Internet Movie Database", "Value"=>"8.0/10"}, 
   {"Source"=>"Rotten Tomatoes", "Value"=>"98%"}, 
   {"Source"=>"Metacritic", "Value"=>"87/100"}], 
   "87", "8.0", "521,717", "tt0073195", "movie", "11 Jul 2000", "N/A", "Universal Pictures", "N/A", "True"]


key = ['Title', 'Year', 'Rated', 'Released', 'Runtime', 'Genre', 'Director', 'Writer', 'Actors', 'Plot', 'Language', 'Country', 'Awards', 'Poster', 
    'Ratings', 'Metascore', 'imdbRating', 'imdbVotes', 'imdbID', 'Type', 'DVD', 'BoxOffice', 'Production', 'Website', 'Response'];

    valueArr = [] 

key_lowercase = []
key.each do |word|
    key_lowercase << word.downcase
    end 
    # value.each do |val|
    #     valueArr << val.replace("\"","'")
    # end


puts key_lowercase
puts value