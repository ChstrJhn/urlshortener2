enable :sessions

# get '/userpage' do
#   if session[:user_id] 
#     @user = User.find(session[:user_id])
#     @shorts = Url.find_by_user_id(session[:user_id]) 
#     erb :userpage
#   else
#     redirect '/'
#   end
# end

# get '/logout' do
#   session.clear
#   redirect '/'
# end

