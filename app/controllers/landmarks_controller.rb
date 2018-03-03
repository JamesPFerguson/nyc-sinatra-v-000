class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/edit'
  end

  post '/landmarks/new' do
    @landmark = Landmark.create(params[:landmark])
    @landmark.figure = Figure.find_or_create_by(name: params[:figure][:name])
    @landmark.save

    redirect "/landmarks/#{@landmark.id}"
  end

  post '/landmarks/:id/edit' do
  end


end
