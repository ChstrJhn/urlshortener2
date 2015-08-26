# enable :sessions

# post '/login' do
#    @input = params[:login]
  
#    unless @input.nil?
#      @login = User.find_by_email(@input[:email])   
#        if @login.password == @input[:password] 
#        session[:user_id] = @login.id
#        redirect '/userpage'
#        else
#        erb :error
#     end
#   end
#     erb :error
# end

# get '/signup' do

#   erb :signup

# end

# post '/signup' do

#   @process = params[:signup]

#   if @process[:password] == @process[:confirm_pass]
#     new_user = User.create(
#       name: @process[:name], 
#       email: @process[:email], 
#       password: @process[:password]
#       )
#     @user = User.find(new_user.id)
#     session[:user_id] = @user.id
#     redirect '/userpage'
#   else
#     erb :error
#   end

# end
