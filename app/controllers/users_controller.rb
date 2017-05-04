class UsersController < ApplicationController
  def search
    @users = User.where('name LIKE(?)',"%#{params[:name]}%").where.not("name = '#{current_user.name}'")

    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end
end
