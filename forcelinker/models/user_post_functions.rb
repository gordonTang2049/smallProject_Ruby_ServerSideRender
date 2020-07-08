

def create_post(target_title, date_of_start, date_of_finish, user_id, milestone, target_content)

    sql = <<~SQL
      INSERT INTO user_post_infor  
      (target_title, date_of_start, date_of_finish, time_zone , user_id, milestone, target_content)
      VALUES
      ($1, $2, $3, NOW(), $4, $5, $6);
    SQL
    
    run_sql(sql, [target_title, date_of_start, date_of_finish, user_id, milestone, target_content])

end



  # def update_post_milestone(milestone, user_id)
  #   sql = <<~SQL
  #     update user_infor_post 
  #     set 
  #     name = $1, 
  #     image_url = $2, 
  #     user_id = $3;
  #   SQL
  #   run_sql(sql, [name, image_url, user_id])
  # end
# ============

  def user_post_infor(id)
    sql = "SELECT * FROM user_post_infor WHERE user_id = $1;"
    run_sql(sql, [id])

  end
# ==================
  
  
  # def all_post
  #   sql = "SELECT * FROM user_infor_post;"
    # implicit return
  #   run_sql(sql)
  # end

# search option, how to search
  def find_post_by_id(id)
    sql = "SELECT * FROM user_post_infor WHERE id = $1;"
    run_sql(sql, [id])[0]
  end


  def update_milestone(id, milestone)
    sql = <<~SQL 
          UPDATE user_post_infor
          SET milestone = $2 
          WHERE
          id = $1;
          SQL
      
    run_sql(sql, [id, milestone])
  end 
def delete_milestone(id)
      sql = <<~SQL 
        UPDATE user_post_infor
        SET milestone = NULL 
        WHERE
        id = $1;
        SQL
      run_sql(sql, [id])
end 
  