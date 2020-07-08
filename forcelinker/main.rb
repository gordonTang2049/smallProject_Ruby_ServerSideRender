require 'bcrypt'
require 'sinatra'
require 'pg'
require 'date'

if development?
  require 'sinatra/reloader'
  require 'pry'
  # also_reload './models/user_function.rb'
end

enable :sessions 

# if I use helpers, every view erb can use that function
helpers do
  def logged_in?
    if  session[:user_id]
      return true
    else
      return false
    end 
   
  end 

  def current_user_name 
    id = session[:user_id]
    sql = "select user_name from users where id = $1"
    run_sql(sql, [id])[0]['user_name']
  end
end

require_relative 'models/user_functions.rb'
require_relative 'models/feature_functions.rb'
require_relative 'controllers/user_controller.rb'
require_relative 'db/shared.rb'
require_relative 'models/user_post_functions.rb'
require_relative 'controllers/user_post_controller.rb'

get '/' do
  @results = all_target


  erb :index
end
