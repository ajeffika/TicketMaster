class Api::V2::GroupsController < Api::V2::BaseController
  # frozen_string_literal: true
  respond_to :json

  def index
    @groups = Group.all
    render json: @groups
  end

  def show
    group = Group.find(params[:id])
    render json: { data: GroupSerializer.new(group) }
  end

  def create
    group = Group.new(group_params)
    if group.save
      render json: { data: GroupSerializer.new(group) }
    else
      render json: 'Record did not save'
    end
  end

  def update
    group = Group.find(group_params[:id])
    if group.update(group_params)
      render json: { data: GroupSerializer.new(group) }
    else
      render json: 'Record did not save'
    end
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    render json: @groups
  end

  private

  def group_params
    params.require(:group).permit(%i[id name])
  end
end
