class WelcomeController < ApplicationController
  # impressionist :actions=>[:index],:unique => [:session_hash]
  def index
    @posts = Post.limit(3).order('id desc')
    @title = "The Philadelphia Area's BEST Escape Room! "
  end

  def assign_title
    @title = "Project Escape - The Conshohocken Escape Room!"
  end
end
