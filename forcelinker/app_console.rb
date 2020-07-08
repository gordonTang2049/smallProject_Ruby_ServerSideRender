require 'bcrypt'
# require 'sinatra'
# require 'sinatra/reloader'
require 'pry'
require 'pg'
require_relative 'models/user_functions.rb'
require_relative 'db/shared.rb'
require 'date'
def all_target  
    sql = "SELECT * from user_post_infor;"
    run_sql(sql)
  end

result = all_target[0]

# p result['date_of_start'] 

date_of_start = []
date_of_start = result['date_of_start'].split(" ")
date_of_start_year = date_of_start[0].split("-")[0]
date_of_start_month = date_of_start[0].split("-")[1]
date_of_start_day = date_of_start[0].split("-")[2]
year = date_of_start_year.to_i
month = date_of_start_month.to_i
day = date_of_start_day.to_i
future = DateTime.new(year,month,day)
now = DateTime.now
days = number_to_percentage((future - now).to_f)
percentage = "#{days}%"
puts percentage






# now = Date.today
# p now
# Date.new(date_of_start_year, date_of_start_month, date_of_start_day) 
# before = Date.new(2020,06,10)
# p before
# diff = (before - now).to_i
# days = (diff/365.25).to_i
# puts days

# By requiring Facets you can then do the following with Time objects.

# Time.now.less(90, :days)



# get '/signup/new' do

#   erb :"/user_account_management/sign_up"
# end


# post '/signup/create' do
#     user_name = params[:user_name]
#     user_email = params[:user_email]

#   is_user_name_exist = check_user_name_exist(user_name)
#   is_user_email_exist= check_user_email_exist(user_email)

#   if is_user_name_exist != nil
        

#     return 
#   end   


#   if is_user_name_exist != nil || is_user_email_exist != nil
      
    
#         @is_the_same

    
#     elsif is_user_email_exist != nil


    


#        erb '/signup/new'
#   end
  
#   cipher_password(password)
#   create_user_account(user_name, user_email, cipher_password)

#   create_dish(
#     params[:name], 
#     params[:image_url], 
# #     current_user['id']
# #   )
#   redirect "/"
# end