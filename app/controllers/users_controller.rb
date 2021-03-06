class UsersController < ApplicationController

    get '/login' do
        erb :login
    end

    post '/login' do
    @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            puts session
            redirect "users/#{@user.id}"
            else
                flash[:error] = "Invalid input! Please try again or go back and sign up!"
                redirect '/login'
        end
    end

    get '/signup' do
        erb :signup
    end



    post '/signup' do
        if params[:name] != "" && params[:email] != "" && params != ""
            @user = User.create(params)
            session[:user_id] = @user.id
            redirect "users/#{@user.id}"
            
            
        else
            redirect '/signup'
        end
    end

    get '/users/:id' do
        
        @user = User.find_by(id: params[:id])
        erb :'/users/user_home_page'
    end

    get '/logout' do
        session.clear
        redirect '/'
    end

end