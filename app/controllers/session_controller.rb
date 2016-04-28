class SessionController < ApplicationController
	def new
    if session[:user_id]
      user = User.find_by(id: session[:user_id])
      redirect_to "/users/#{user.id}"
    end
	end

	def create
	end

  def destroy
    # logout
  end
end

#   def create
#     user = User.find_by(name: params[:user][:name])
#     if user && user.password_hash == params[:user][:password_hash]
#       session[:user_id] = user.id
#       redirect_to user
#     else
#       redirect_to '/login'
#     end
#   end

#   def destroy
#     # destroy route should log the user out.
#     # use reset_session method and redirect to root page.
#     reset_session
#     redirect_to '/'
#   end
# end
