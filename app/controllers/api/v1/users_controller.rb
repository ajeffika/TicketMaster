# frozen_string_literal: true

class Api::V1::UsersController < Api::V1::BaseController
  def index
    @users = User.all #TODO Write a query to show only users form a specified scope
    render json: @users
  end

  def show
    user = User.find(params[:id])

    render json: user
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: @users
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: 'Record did not save'
    end
  end

  def update
    user = User.find(user_params[:id])

    if user.update(user_params)
      render json: user
    else
      render json: 'Record did not save'
    end
  end

  private

  def user_params
    params.require(:user).permit(%i[email
                                    username
                                    first_name
                                    last_name
                                    age
                                    role
                                    address_id])
  end
end
