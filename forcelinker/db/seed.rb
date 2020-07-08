require_relative 'shared'
require_relative './models/dish'



create_user('dt@ga.co', 'pudding')

user = find_one_user_by_email('dt@ga.co')

title1 = ['pudding', 'cakey', 'ribs', 'smoky']
title2 = ['cake', 'cotton', 'muffin', 'pancakes']

def create_dish(name, image_url, user_id)
    sql = <<~SQL
      INSERT INTO dishes 
      (name, image_url, user_id)
      VALUES
      ($1, $2, $3);
    SQL
    run_sql(sql, [name, image_url, user_id])
  end
  date_of_start | date_of_finish | time_zone | user_id | milestone | target_tite 

  def create_post


   


    sql = <<~SQL
      INSERT INTO dishes 
      (name, image_url, user_id)
      VALUES
      ($1, $2, $3);
    SQL
    run_sql(sql, [name, image_url, user_id])
  end

5.times do
  create_dish("#{title1.sample} #{title2.sample}", 'imgURL', user['id'])
end