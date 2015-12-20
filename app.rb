require 'sinatra'
require 'sinatra/activerecord'

# extablish database connection
set :database, 'sqlite3:myblogdb.sqlite3'

# model
class Post < ActiveRecord::Base
end

#get all posts
get '/' do
	@posts = Post.all
	erb :'posts/index'
end

#create a new post
get '/posts/new' do
 @post = Post.new
 erb :'posts/new'
end

post '/posts' do
 @post = Post.new(params[:post])
 if @post.save
   redirect '/'
 else
   erb :'posts/new'
 end
end

# view indiviual post
get '/posts/:id' do
 @post = Post.find(params[:id])
 erb :'posts/show'
end