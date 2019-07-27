class Api::V1::GroupSquadsController < Api::V1::BaseController
  # frozen_string_literal: true
  respond_to :json

  def index
    @group_squads = GroupSquad.all
    render json: @group_squads
  end

  def show
    group_squad = GroupSquad.find(params[:id])
    render json: { data: GroupSquadSerializer.new(group_squad) }
  end

  def create
    group_squad = GroupSquad.new(group_squad_params)
    if group_squad.save
      render json: { data: GroupSquadSerializer.new(group_squad) }
    else
      render json: 'Record did not save'
    end
  end

  def update
    group_squad = GroupSquad.find(group_squad_params[:id])
    if group_squad.update(group_squad_params)
      render json: { data: GroupSquadSerializer.new(group_squad) }
    else
      render json: 'Record did not save'
    end
  end

  private

  def group_squad_params
    params.require(:group_squad).permit(%i[id name])
  end
end
