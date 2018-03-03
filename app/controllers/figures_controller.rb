class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    @landmarks = Landmark.all
    @titles = Title.all

    erb :'/figures/index'
  end


  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures/new' do
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(id: params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])
    erb :'/figures/show'
  end

  post '/figures/:id/edit' do
    @figure = Figure.find_by(id: params[:id])
    @figure.update(params[:figure])
    if !params["title"]["name"].empty?
      @figure.titles << Title.create(params["title"])
    end
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(params["landmark"])
    end
    @figure.save
    flash[:message] = "Successfully updated Figure"
    redirect "figures/#{@figure.id}"
  end


end
