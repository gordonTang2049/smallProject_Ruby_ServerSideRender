
# Create
get '/user/add_post' do
    
    erb :"/user_goal_post/create_user_goal_post"
    
end 



post '/user/create_new_post' do

    user_id = session[:user_id]

    target_title= params[:title] 
    date_of_start = params[:date_of_start]
    date_of_finish = params[:date_of_finish]
    milestone = params[:milestone]
    target_content = params[:target_content]

    create_post(target_title, date_of_start, date_of_finish, user_id, milestone,target_content)
    @results = user_post_infor(user_id)
    
    erb :"/user_goal_post/user_index"
end 

# read
get '/user/posts' do
    user_id = session[:user_id]
    @results = user_post_infor(user_id)
    

    erb :"/user_goal_post/user_index"
end 

get '/user/posts_editor/:id' do
    # Make sure, it is that user_id 
    # user_id = session[:user_id]
    # @results = user_post_infor(user_id)
    post_id = params[:id]
    
    @result = find_post_by_id(post_id)

    erb :"/user_goal_post/user_post_edit"
end


# edit milestone 

patch '/user/post_edit' do 
post_id = params[:id].to_i
milestone_edit = params[:milestone_edit]
    
update_milestone(post_id, milestone_edit)
redirect '/user/posts'  
end 


# delete milestone 

delete '/user/delete_post_milestone' do
    post_id = params[:id].to_i
    delete_milestone(post_id)
    
    redirect '/user/posts'

end     