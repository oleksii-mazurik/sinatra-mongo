require 'sinatra'
require	'mongoid'


configure do
	Mongoid.load!("mongoid.yml")
end

get '/' do
  erb :home
end

get '/memory' do
  ram = `top -l 1 | head -n 10 | grep PhysMem | sed 's/, /n /g'`
	erb :memory, :locals => { :ramInfo => ram }
end


get '/disk' do
   diskArray = `df -h`.lines
   erb :disk, :locals => { :all => diskArray }
end


