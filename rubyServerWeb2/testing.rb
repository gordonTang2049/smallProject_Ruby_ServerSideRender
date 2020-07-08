require 'httparty'
require 'json'

# file = File.open("JsonMovie.txt", 'r')


# puts movie.values


movie = HTTParty.get('http://omdbapi.com/?t=blade_runner&apikey=2f6435d9')
# Blade Runner 
arrayA = []
arrayB = []

# .each do |n| puts n  end
# p movie.values[""]
p movie[Year].values



#  jason = file.JSON.parse(json_string)

#  print jason
# p file.each do |key, value| arrayA << key; arrayB << value end 
# file.write(option)
# file.close


# https://gist.github.com/epoch/6a7ac3bce7684984d527

# ==========================
# ### Movies I

# ## Specification

# Build a web app that allows users to search for movies and
# display it on the page. The web app will enlist the help of a library called HTTParty 
# to fetch movie information from a 3rd party service called OMDB API.


# - Build a Sinatra application 
# 	- Include:
# 		- main.rb		
# 		- views/layout.erb
# 		- views/index.erb
# 		- views/movie.erb
# 		- views/about.erb
# 		- public/css/style.css

# ---

# - index.erb - the search form with the input box
# - movie.erb - details of the movie 


# ## diagram of architecture
# ```
#         req                       use httparty to make a req to omdbapi.com  
# 	       |                                           |
# 	       |                                           | 
# [browser]------------>[movies app]-------------------------------------------------->[omdb api]


#               res                    JSON response from omdbapi.com in a ruby hash
# 	       |                                           |
# [browser]<------------[movies app]<--------------------------------------------------[omdb api]
# ```

# ## example httparty usage

# To make HTTP request in ruby we can use the `HTTParty` library

# ```ruby
# require 'httparty'
# result = HTTParty.get('http://omdbapi.com/?t=once&apikey=XXXXXX')

# ```

# ## Additional Resources
# - [demo](http://dt-movies-viewer.herokuapp.com)
# - [Open movie database API](http://www.omdbapi.com/)
# - [sinatrarb](http://www.sinatrarb.com/)
# - [HTTParty](https://github.com/jnunemaker/httparty)