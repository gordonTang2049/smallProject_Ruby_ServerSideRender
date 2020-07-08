
  
def all_target
  sql = "SELECT * from user_post_infor;"
  run_sql(sql)
end

# nil
def check_user_name_exist(user_name_input)
  sql = "SELECT user_name FROM users where user_name = $1;"

  result = run_sql(sql, [user_name_input])
  result.values[0]
end   

# nil
def check_user_email_exist(user_email_input)
  sql = "SELECT user_name FROM users where user_name = $1;"
  result = run_sql(sql, [user_email_input])
  result.values[0]
end   
  # create
  

  

def cipher_password(password)
  cipher_password = BCrypt::Password.create(password)

end

def create_user_account(user_name, user_email, cipher_password)
        sql = <<~SQL
        INSERT INTO users 
        (user_name, user_email, password_digest)
        VALUES
        ($1, $2, $3);
        SQL
        run_sql(sql, [user_name, user_email, cipher_password])

end 


# =============login===============

 
  
 # The variable must be ->  like   $123 
        # dollar sign is vaildate SQL 


        # $1 ->  variable number 1    $2 variable number 2 
      

    
    # run_sql_safe_mode(sql, [params[:id]]).first['email']
    # run_sql_safe_mode("select * from users where id = $1 and id = $2", ["haha", "haha2"]).first['email']
# @dish = run_sql(sql, [params[:id]]).first   -> .first is [0] first record of collection
    # run_sql("select * from users where id = #{session[:user_id]; }")[0]['email']


# ===============login================
  # delete - todo
  # update - todo