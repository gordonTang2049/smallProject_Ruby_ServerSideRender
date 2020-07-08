     
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'pg'

def run_sql(sql)
  conn = PG.connect(dbname: 'goodfoodhunting')
  results = conn.exec(sql)
  conn.close
  return results
end

# read
get '/' do
  @results = run_sql("select * from dishes;")
  erb :index
end


# route - more specific path pattern
# read
get '/dishes/new' do
  erb :new_dish
end
# "/details?id=1
# /dishes/1

# read
# get '/details'
get '/dishes/:id' do
  # params - query string, forms inputs, named parameter
  #   /movies?title=jaws
  #   /movies/jaws

  # client will send us the id of the dish they want

  conn = PG.connect(dbname: 'goodfoodhunting')
  sql = "SELECT * FROM dishes WHERE id = #{params[:id]};"
  results = conn.exec(sql)
  conn.close

  @dish = results[0] # bold move

  erb :details
end

post '/dishes' do
  conn = PG.connect(dbname: 'goodfoodhunting')
  sql = "insert into dishes (name, image_url) values ('#{ params[:name] }', '#{ params[:image_url] }');"

  conn.exec(sql)

  conn.close

  redirect '/'
end

delete '/dishes/:id' do
  conn = PG.connect(dbname: 'goodfoodhunting')
  sql = "delete from dishes where id = #{ params[:id] };"
  conn.exec(sql)
  conn.close

  redirect '/'
end

# params is a feature from sinatra
get '/dishes/:id/edit' do
  conn = PG.connect(dbname: 'goodfoodhunting')
  sql = "select * from dishes where id = #{ params[:id] };"
  results = conn.exec(sql) # [{ 'id' => 1, 'name' => 'ribs' }] 

  @dish = results[0]

  erb :edit_dish  
end

patch '/dishes/:id' do
  conn = PG.connect(dbname: 'goodfoodhunting')
  sql = "update dishes set name = '#{ params[:name] }', image_url = '#{ params[:image_url] }' where id = #{ params[:id] };"

  conn.exec(sql)

  # redirect is just making request on behalf of your users
  # its a get request
  redirect "/dishes/#{ params[:id] }"
end






