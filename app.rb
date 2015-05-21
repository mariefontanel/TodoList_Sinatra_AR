require 'sinatra'
require 'sinatra/activerecord'

ActiveRecord::Base.establish_connection(
	:adapter => 'sqlite3',
  	:database =>  'dev.db'
	)

ActiveRecord::Base.default_timezone= :local

class Todo < ActiveRecord::Base
end

get '/' do
	@todo = Todo.all()
	@title = "Todo"
	erb :index
end
post '/' do
	@todo = Todo.new(params[:todos])
	@todo.save
	redirect '/'
end
get '/:id' do
	@todo = Todo.find(params[:id])
	@todo.save
	erb :edit
end

put '/:id' do
	@todo = Todo.find(params[:id])
	@todo.update_attributes(params[:todos])
	redirect '/'
end