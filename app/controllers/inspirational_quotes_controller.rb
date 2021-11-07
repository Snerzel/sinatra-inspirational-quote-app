class InspirationalQuotesController < ApplicationController

    get '/inspirational_quotes/new' do
        erb :'/inspirational_quotes/new'
    end

    post '/inspirational_quotes' do
        if !logged_in?
            redirect '/'
        end

        if params[:content] != ""
            flash[:message] = "Success!!"
            @inspirational_quote = InspirationalQuote.create(content: params[:content], user_id: current_user.id)
            redirect "/inspirational_quotes/#{@inspirational_quote.id}"
        else
            flash[:error] = "Oops! Can't do that."
            redirect '/inspirational_quotes/new'
        end
    end

    get '/inspirational_quotes/:id' do
        inspirational_quote_helper
        erb :'/inspirational_quotes/show'
    end

    get '/inspirational_quotes/:id/edit' do
        inspirational_quote_helper
        if logged_in?
            if authorized?(@inspirational_quote)
                erb :'/inspirational_quotes/edit'
            else
                redirect '/login'
            end
        else
            redirect '/welcome'
        end
    end

    patch '/inspirational_quotes/:id' do
        inspirational_quote_helper
        if logged_in?
            if authorized?(@inspirational_quote) && params[:content] != ""
                @inspirational_quote.update(content: params[:content])
                redirect "/inspirational_quotes/#{@inspirational_quote.id}"
            else
                redirect '/login'
            end
        else
            redirect '/welcome'
        end
    end

    get '/inspirational_quotes' do
        @inspirational_quotes = InspirationalQuote.all
         erb :'inspirational_quotes/index'
    end

    delete '/inspirational_quotes/:id' do
        inspirational_quote_helper
        if authorized?(@inspirational_quote)
            @inspirational_quote.destroy 
            redirect "/users/#{current_user.id}"
        else
            redirect "/users/#{current_user.id}"
        end
    end

    def inspirational_quote_helper
        @inspirational_quote = InspirationalQuote.find(params[:id])
    end

    
end
