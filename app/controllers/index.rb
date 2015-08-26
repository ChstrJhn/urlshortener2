

get '/' do

  # @details = params[:login]
  # unless User.find_by (password: @details[:password], email: @details[:email]).nil?
  # erb :userpage
  # else
  @shorturl = Url.all
  erb :home
 # end

end


post '/login' do
   @input = params[:login]
  
   unless @input.nil?
     @login = User.find_by_email(@input[:email])   
       if @login.password == @input[:password] 
       session[:user_id] = @login.id
       redirect '/userpage'
       else
       erb :error
    end
  end
    erb :error
end

get '/signup' do

  erb :signup

end

post '/signup' do

  @process = params[:signup]

  if @process[:password] == @process[:confirm_pass]
    new_user = User.create(
      name: @process[:name], 
      email: @process[:email], 
      password: @process[:password]
      )
    @user = User.find(new_user.id)
    session[:user_id] = @user.id
    redirect '/userpage'
  else
    erb :error
  end

end

get '/userpage' do
  if session[:user_id] 
    @userz = User.find(session[:user_id])

    @shorts = @userz.urls.all
    erb :userpage
  else
    redirect '/'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end



post '/urls' do
  url = params[:url]
  new_link = Url.create(ori_url: url)
  new_link.save!
  @shorturl =Url.all 
  
  erb :home 
end

# # e.g., /q6bda
get '/urls/:short_url' do
  # redirect to appropriate "long" URL
  redirect = Url.find_by_short_url(params[:short_url])
  redirect.click_count += 1
  redirect.save
  redirect redirect.ori_url
end

post '/urls/user' do 
  # byebug
  @url = params[:post]
  
  # byebug
  @user = User.find_by_id(session[:user_id])
  @user.urls.create(ori_url: @url[:url])

  # @new_link = Url.create(ori_url: @url[:url])
  # @user.url << @new_link
  # @short = Url.all
  redirect '/userpage'
end

