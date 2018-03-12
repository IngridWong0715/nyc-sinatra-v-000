class FiguresController < ApplicationController

  get '/figures' do
    erb :'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  post '/figures' do

    @figure = Figure.new(params[:figure])
    if !params[:title][:name].empty?
      @figure.titles.build(params[:title])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks.build(params[:landmark])
    end
    @figure.save

    redirect '/figures'
  end



end
