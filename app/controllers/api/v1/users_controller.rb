# frozen_string_literal: true

class Api::V1::UsersController < Api::V1::BaseController
  def index
    @users = User.all.order('created_at ASC')
    render json: @users
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    user = User.new(user_params)
    if user.save!
      render json: { data: UserSerializer.new(user) }
    else
      render json: 'Record did not save'
    end
  end

  def update
    user = User.find(user_params[:id])
    if user.update(user_params)
      render json: { data: UserSerializer.new(user) }
    else
      render json: 'Record did not save'
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: @users
  end

  private

  def user_params
    params.require(:user).permit(%i[id
                                    email
                                    username
                                    first_name
                                    last_name
                                    birth_date
                                    role
                                    address_id])
  end
end
