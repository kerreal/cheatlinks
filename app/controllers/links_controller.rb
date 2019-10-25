class LinksController < ApplicationController
  def index
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.create(link_params)
    if @link.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :link, :discription)
  end
end
