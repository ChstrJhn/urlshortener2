enable :sessions

get '/' do

  # @details = params[:login]
  # unless User.find_by (password: @details[:password], email: @details[:email]).nil?
  # erb :userpage
  # else
  erb :home
 # end

end

post '/login' do
   @input = params[:login]
   @login = User.find_by_email(@input[:email])

   if @login.password == @input[:password] 
    session[:user_id] = @login.id
    @user = @login.name
    redirect '/userpage'
  else
    erb :error
  end

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
    erb :userpage
  else
    erb :home
  end
end

get '/logout' do
  session.clear
  erb :home
end