class InspirationalQuotesController < ApplicationController

    get '/inspirational_quotes/new' do
        erb :'/inspirational_quotes/new'
    end

    post '/inspirational_quotes' do
        if !logged_in?
            redirect '/'
        end

        if params[:content] != ""
            @inspirational_quote = InspirationalQuote.create(content: params[:content], user_id: current_user.id)
            redirect "/inspirational_quotes/#{@inspirational_quote.id}"
        else
            redirect '/inspirational_quotes/new'
        end
    end

    get '/inspirational_quotes/:id' do
        @inspirational_quote = InspirationalQuote.find(params[:id])
        erb :'/inspiration_quotes/show'
    end
end
