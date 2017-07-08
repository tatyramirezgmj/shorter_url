class LinksController < ApplicationController
  def index
    @link = Link.new
    @links = Link.all
  end

  def create
    @link = Link.new(link_params)

    @link.in_url = "https://#{@link.in_url}" unless @link.in_url.include?("https://") || @link.in_url.include?("http://")

    @link.short_link = random_id
    if @link.save
      redirect_to root_path
    end
  end

  def show
    link = Link.find_by_short_link(params[:id])
    redirect_to link.in_url
  end



  private
  def link_params
    params.require(:link).permit(:in_url)
  end
  def random_id
    (0...5).map { ('a'..'z').to_a[rand(26)] }.join
  end
end
