class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find_by(id: params[:id])
  end

  def new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      redirect_to cat_url(@cat)
    else
      redirect_to new_cat_url
    end
  end

  def edit
    find_cat
    render :edit
  end

  def update
    find_cat
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      redirect_to edit_cat_url(@cat)
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :birth_date, :sex, :color, :description)
  end

  def find_cat
    @cat = Cat.find_by(id: params[:id])
  end
end
