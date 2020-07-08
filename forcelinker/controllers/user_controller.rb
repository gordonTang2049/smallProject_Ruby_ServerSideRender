


# ===============Create
get '/signup/new' do
  erb :"/users/signup"
end

get '/signin' do 

  erb :"/users/login"
end 


post '/signup/create' do
  @repeat_user_name = false
  @repeat_user_email = false
  @user_password_inconsistent = false

  $user_input_name = params[:user_name]
  $user_input_email = params[:user_email]
  
  #
  $is_user_name_exist = check_user_name_exist($user_input_name)
  $is_user_email_exist = check_user_email_exist($user_input_email)

  $user_password = params[:user_password]
  $user_confirmed_password = params[:user_confirmed_password]

  if $is_user_name_exist != nil || $is_user_email_exist != nil || $user_password != $user_confirmed_password
      
      if $is_user_name_exist != nil
        @repeat_user_name = true 
      end      
      
      if  $is_user_email_exist != nil
        @repeat_user_email = true 
      end 
       

      if $user_password != $user_confirmed_password
        @user_password_inconsistent = true 
        # raise @user_confirmed_password.inspect
      end
      return erb :"/users/signup"
    else
      
      cipher_user_password = cipher_password($user_password)
      create_user_account($user_input_name , $user_input_email, cipher_user_password)
  end 


 redirect '/'
end

# ========================login==========


post '/login' do
  # @logged_in_warning = nil
  # if logged_in?
  #   @logged_in_warning = "You have already logged in, please log out first"
  #   redirect '/'
  # end 
    
  user_email_input = params[:user_email]
  $user_input_password = params[:password]

  sql = "select * from users where user_email = $1;"
  result = run_sql(sql, [user_email_input])
  
  if result.count == 1 && BCrypt::Password.new(result[0]['password_digest']) == $user_input_password
    
    session[:user_id] = result[0]['id']
  
  end 
  redirect '/user/posts'
end



delete '/session' do
  session[:user_id] = nil
  redirect '/'

end 

