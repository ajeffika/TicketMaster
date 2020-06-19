class Api::V1::CategoriesController < Api::V1::BaseController
  # frozen_string_literal: true
  respond_to :json

  def index
    categories = Category.all
    render json: categories
  end

  def show
    category = Category.find(params[:id])

    render json: { data: CategorySerializer.new(category) }
  end

  def create
    category = Category.new(category_params)
    if category.save
      render json: { data: CategorySerializer.new(category) }
    else
      render json: 'Record did not save'
    end
  end

  def update
    category = Category.find(category_params[:id])

    if category.update(category_params)
      render json: { data: CategorySerializer.new(category) }
    else
      render json: 'Record did not save'
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    render json: @categories
  end

  private

  def category_params
    params.require(:category).permit(%i[id
                                        name
                                        description
                                        sla_id])
  end
end
