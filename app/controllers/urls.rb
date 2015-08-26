# enable :sessions

# post '/urls' do
#   url = params[:url]
#   new_link = Url.create(ori_url: url)
#   new_link.save!
#   @shorturl =Url.all 
  
#   erb :home 
# end

# # # e.g., /q6bda
# get '/urls/:short_url' do
#   # redirect to appropriate "long" URL
#   redirect = Url.find_by_short_url(params[:short_url])
#   redirect.click_count += 1
#   redirect.save
#   redirect redirect.ori_url
# end

# post '/urls/user' do
#   @url = params[:post]
#   @new_link = Url.create(ori_url: @url[:url])
#   p @user = User.find_by_id(session[:user_id])
#   @user.urls << @new_link
#   @short = Url.all
#   erb :userpage
# end