class LinksController < ApplicationController
  def index
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.create(link_params)
    redirect_to root_path
  end

  private

  def link_params
    params.require(:link).permit(:title, :link, :discription)
  end
end
