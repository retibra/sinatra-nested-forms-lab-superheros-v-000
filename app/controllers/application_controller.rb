require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do
      @team_name = params[:team][:name]
      @team_motto = params[:team][:motto]
      @names = []
      @powers = []
      @bios = []
      @team_members = params[:team][:members]
      @team_members.each do |tm|
        @names << tm.name
        @powers << tm.power
        @bios << tm.bio
      end
      erb :team
    end

end
