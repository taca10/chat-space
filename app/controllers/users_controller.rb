class UsersController < ApplicationController
  def search
    @users = User.where.not("name = '#{current_user.name}'")
    @users = @users.where('name LIKE(?)',"%#{params[:name]}%")

    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end
end
