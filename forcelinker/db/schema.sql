CREATE DATABASE forcelinker;

 id | data_of_start | data_of_finish | time_zone | user_id | milestone 

CREATE TABLE user_target_infor (
  id SERIAL PRIMARY KEY,
  data_of_start TIMESTAMP,
  data_of_finish TIMESTAMP,
  time_zone TIMESTAMPTZ,
  user_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    user_name VARCHAR(500),
    user_email VARCHAR(500),
    password_digest VARCHAR(500)     
);

ALTER TABLE table_name ADD COLUMN new_column_name data_type;

ALTER TABLE user_target_infor ADD COLUMN milestone VARCHAR(2000);

TRUNCATE TABLE users;

INSERT INTO users () 
 sql = <<~SQL
      INSERT INTO dishes 
      (name, image_url, user_id)
      VALUES
      ($1, $2, $3);
    SQL
====================================
    -> NOW() -> TIME STAMP WITH TIME ZONE

 INSERT INTO user_post_infor(date_of_start, date_of_finish, time_zone, user_id, target_title, target_content, milestone)
    VALUES ('05/05/2020','05/10/2020', NOW(), 21, 'Create forcelinker', 'Create a social media that tracking your goal archieving process, you can 
    upload your video, photo, what you feel during archieving the goal', 'create basic social media framework' );


    INSERT INTO user_post_infor(date_of_start, date_of_finish, time_zone, user_id, target_title, target_content, milestone)
    VALUES ('02/03/2020','03/09/2020', NOW(), 21, 'Having 7 monitors for coding', 'save enough money to buy 7 monitor', 'buy muti-screen adaptor in 1 month' );


    INSERT INTO user_post_infor(date_of_start, date_of_finish, time_zone, user_id, target_title, target_content, milestone)
    VALUES ('04/02/2020','20/10/2020', NOW(), 21, 'Buy Mac book', 'save money to buy a second hand mac book', 'save 100 dollars' );


    select column_name, data_type from information_schema.columns
    -# where table_name = 'config';

    SELECT pg_typeof("stu_id"), pg_typeof(100) from student_details limit 1;

    SELECT column_name, data_type FROM information_schema.columns WHERE 
    table_name = 'YOUR_TABLE' AND column_name = 'YOUR_FIELD';


    SELECT column_name, data_type
    FROM   information_schema.columns
    WHERE  table_name = 'user_post_infor'
    ORDER  BY ordinal_position;    

    select column_name, data_type 
    from information_schema.columns 
    where table_catalog = 'sandbox'
      and table_schema = 'public'
      and table_name = 'test';

ALTER TABLE user_target_infor 
RENAME COLUMN data_of_start TO date_of_start;

ALTER TABLE user_target_infor 
RENAME COLUMN data_of_finish TO date_of_finish;


ALTER TABLE user_target_infor RENAME TO user_post_infor;


ALTER TABLE user_target_infor 
ADD COLUMN data_of_finish TO date_of_finish;


ALTER TABLE user_post_infor 
ADD COLUMN target_tite VARCHAR(500);



ALTER TABLE user_post_infor 
RENAME COLUMN target_tite TO target_title;

ALTER TABLE user_post_infor 
ADD COLUMN target_content TEXT;


==================================   
Update
UPDATE table
SET column1 = value1,
    column2 = value2 ,...
WHERE
   condition;

UPDATE link
SET last_update = DEFAULT
WHERE
   last_update IS NULL;



   UPDATE user_post_infor
          SET milestone = 'I want a cake' 
          WHERE
          id = 1;
======================
Test delete -> Null a record
UPDATE table SET col=NULL where col='';





=======================================
Time stamp HTML =====


<label for="start">Start date:</label>

<input type="date" id="start" name="trip-start"
       value="2018-07-22"
       min="2018-01-01" max="2018-12-31">


=======
===========================
Progress Bar

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>Basic Progress Bar</h2>
  <div class="progress">
    <div class="progress-bar" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:9%">
      <span class="sr-only">70% Complete</span>
    </div>
  </div>
</div>

</body>
</html>

==================================


<span class="sr-only">70% Complete</span>
        # show logout
        # show delete session -> logout
        

# <form action="/session" method="delete">

# //////<% input type is default as text %>

# <input type="hidden" name="_method" value="delete">
# <button>Logout</button>
# </form>



#       else


      
#       result = run_sql(sql)

#       if result.count == 1 && Bcrypt::Password.new(result[0]['password_digest']) == params[:password]

#           session[:user_id] = result[0]['id']
          

#           session[:email] = result[0]['email']  

#           redirect '/' 
#       else
      
        
#         erb :login
#       end
      
#     end
      
#     end 


# ===========


# ===========

# _user_name_exist = check_user_name_exist(user_name_input)
#   is_user_email_exist= check_user_email_exist(user_name_input)

#  
      
#     if is_user_name_exist != nil
#         @is_the_same

    
#     elsif is_user_e
# cipher_password(password)
# create_user_account(user_name, user_email, cipher_password)

# create_dish(
#   params[:name], 
#   params[:image_url], 
#   current_user['id']
# )
# redirect "/"

# ismail_exist != nil
# erb '/signup/new'
# end

# get '/dishes/:id' do
#   @dish = find_one_dish_by_id(params[:id])
#   erb :"/dishes/show"
# end







Login 


 
<%if @repeat_user_name == true || @repeat_user_email == true || @user_password_inconsistent == true %>

<% if @repeat_user_name == true %>
<%= "Your user name is same as other crazy one " %>
<% end%>

<%if @repeat_user_email == true %>
<%= "Your Email is same as other crazy one "%>
<% end %>
<%if params[:user_password] == params[:user_confirmed_password] %>
<%= "Your password and confirm password do not match"%>
<%end %>

<%else%>
<p> Here's for the crazy one, the misfit, the round pegs in square hole</p>
<%end%>






  def create_user(user_name, user_email, password)
    password_digest = BCrypt::Password.create(password)
  
    sql = <<~SQL
      INSERT INTO users 
      (user_name, user_email, password_digest)
      VALUES
      ($1, $2, $3);
    SQL
    run_sql(sql, [user_name, user_email, password])
  end
  



  # require 'bcrypt'
# require 'sinatra'
# require 'sinatra/reloader'
# require 'pry'
# require 'pg'

# also_reload 'db/shared'

# read
# def all_user_name
#   sql = "SELECT user_name FROM users;"
  # implicit return
#   run_sql(sql)
# end

# def all_user_email
#   sql = "SELECT user_email FROM users;"
  # implicit return
#   run_sql(sql)
# end