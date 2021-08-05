class UsersController < ApplicationController
def index

  matching_users = User.all

  @list_of_users = matching_users.order({ :username => :asc })
  render({ :template => "user_templates/index.html.erb" })
end

def show

  url_username = params.fetch("path_username")

  matching_usernames = User.where({ :username => url_username })

  @the_user = matching_usernames.at(0)

  render({ :template => "user_templates/show.html.erb" })
end

def new_user

  new_user = params.fetch("input_username")
  @new_id = new_user 

  a_new_user = User.new 

  a_new_user.username = new_user 

  a_new_user.save 

  
  #render({ :template => "user_templates/add.html.erb" })

  redirect_to("/users/" + a_new_user.username )
end

def update 
#Parameters: {"input_username"=>"catherinaa", "path_id"=>"122"}

the_id = params.fetch("path_id")
matching_user = User.where({ :id => the_id})
the_user = matching_user.at(0)

#the_update = params.fetch("input_username")
the_user.username = params.fetch("input_username")

the_user.save 

redirect_to("/users/" + the_user.username)
#render({ :template => "user_templates/update.html.erb" })
end


end