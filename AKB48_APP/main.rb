require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'pg'


def run_sql(sql)
  conn = PG.connect(dbname: 'akb48', password: '123456')
  results = conn.exec(sql)
  conn.close
  return results
end

get '/' do


  sql = "SELECT * FROM akb48;"  
  @results = run_sql(sql)
  erb :index
end

# read ============================= read
get '/akb48/new' do
  erb :new_member
end


# get '/details'
get '/akb48/:id' do
  # params - query string, forms inputs, named parameter
  #   /movies?title=jaws
  #   /movies/jaws

  # client will send us the id of the dish they want

  
  sql = "SELECT * FROM akb48 WHERE id = #{params[:id]};"
  @results = run_sql(sql)[0]
   

  erb :details
end

# Read ============================= Read


# Insert new record=========================
post '/akb48' do

  sql = "insert into akb48 (name, image_url, dob, year_of_joining, year_of_leaving)  
  values ('#{params[:name]}', '#{params[:image_url]}', '#{params[:dob]}', '#{params[:year_of_joining]}', '#{params[:year_of_leaving]}');"
  results = run_sql(sql)

  # make sure it only post one time, not keep refresh to mess up 
  redirect '/'
end
# Insert new record=========================

# ==============delete, post -> Delete 
delete '/akb48/:id' do
  
  sql = "delete from akb48 where id = #{ params[:id] };"
  run_sql(sql)
  
  redirect '/'
end

# ==== It loads only your own item and your can pick your own items you wanted to edit ============
get '/akb48/:id/edit' do
  
  sql = "select * from akb48 where id = #{params[:id]};"
  @results = run_sql(sql)[0] # [{ 'id' => 1, 'name' => 'ribs' }]
  # @dish = results[0]

  erb :edit_akb48  
end
# ==== It loads only your own item and your can pick your own items you wanted to edit ============



# ============= edit, post -> patch -> edit
patch '/akb48/:id' do
    
  sql = "update akb48 set dob = '#{ params[:dob]  }', year_of_joining = '#{ params[:year_of_joining] }', year_of_leaving = '#{ params[:year_of_leaving] }' where id = #{ params[:id] };"
  run_sql(sql)

  # redirect is just making request on behalf of your users
  # its a get request
  redirect "/akb48/#{ params[:id] }" # redirect to Get id details page
end
# ============= edit 