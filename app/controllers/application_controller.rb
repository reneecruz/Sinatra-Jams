require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end

  get "/" do
    erb :welcome
  end

  get "/artists" do
    @artists = Artist.all
    erb :index
  end

  get "/artists/new" do
    erb :new
  end

  post "/artists" do
    @artist = Artist.create(params[:artist])
    redirect "/artists/#{@artist.id}"
  end

  get "/artists/:id" do
    @artist = Artist.find(params[:id])
    erb :show
  end

  get "/artists/:id/edit" do
      @artist = Artist.find(params[:id])
    erb :edit
  end


  patch "/artists/:id" do
    @artist = Artist.find(params[:id])
    @artist.update(params[:artist])
    redirect "/artists/#{@artist.id}"
  end

  delete "/artists/:id" do
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect "/artists"
  end

end
