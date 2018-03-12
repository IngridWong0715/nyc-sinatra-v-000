class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
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

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do

    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/edit'
  end

  patch '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if !params[:title][:name].empty?
      @figure.titles.build(params[:title])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks.build(params[:landmark])
    end
    @figure.save


    redirect "/figures/#{@figure.id}"
  end




end
