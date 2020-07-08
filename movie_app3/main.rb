require 'httparty'
require 'sinatra' 
require 'sinatra/reloader'
require 'pry'
require 'pg'


def run_sql(sql)
    conn = PG.connect(dbname: 'omdb_test')
    results = conn.exec(sql)
    conn.close
    return results
  end

get '/' do
    
    erb :index
end 



get '/movie' do
    
    @movie_title = params[:title].to_s.downcase
    
    # have yet catch can't search on API error
    sql = "SELECT title FROM omdb_test where title = '#{@movie_title}';"
    $result = run_sql(sql)
    
    
     
    
    if $result.values[0] == nil
            
        begin
        @omdb_result = HTTParty.get("http://omdbapi.com/?t=#{@movie_title}&apikey=2f6435d9")
        rescue
        
        redirect '/'
        end 
        

        @title = @omdb_result['Title'].downcase
        @year = @omdb_result['Year']
        @runtime = @omdb_result['Runtime']
        @casting = @omdb_result['Actors']
        @language = @omdb_result['Language']
        @plot = @omdb_result['Plot']
        @poster = @omdb_result['Poster']




    #  <<~insert 
     sql_insert = "INSERT INTO omdb_test (title, year, runtime, actors, language, plot, poster)VALUES ('#{@title}', #{@year}, '#{@runtime}', '#{@casting}', '#{@language}', '#{@plot}','#{@poster}');"
        
        # insert

        run_sql(sql_insert)
    else
        @movie_title = params[:title].to_s.downcase
        sql = "SELECT * FROM omdb_test where title = '#{@movie_title}';"
        result = run_sql(sql)[0]

        @title = result['title'].split(/ |\_|\-/).map(&:capitalize).join(" ")
        @year = result['year']
        @runtime = result['runtime']
        @casting = result['actors']
        @language = result['language']
        @plot = result['plot']
        @poster = result['poster']


    end


    erb :movie
end

# clear every rows in table
# TRUNCATE TABLE table_name;

# "kirk douglas".split(/ |\_|\-/).map(&:capitalize).join(" ") 
#=> "Kirk Douglas"

# .titleize #or capitalize
# Rails's titleize will convert things like dashes and 
# underscores into spaces and can produce other unexpected results,
# especially with case-sensitive situations as pointed out by @JamesMcMahon: