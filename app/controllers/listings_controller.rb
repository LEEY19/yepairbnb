class ListingsController < ApplicationController
  before_action :find_listing, except: [:search, :index, :new]

  def index
    @listings = Listing.all.order('created_at DESC')
    @listings = @listings.search(params[:search]) if params[:search].present?
    if params[:search].present?
      flash[:notice] = "Here are the PairBnB listings relevant to your search:"
    end
  end

  def new
    @listing = current_user.listings.build
  end

  def show
  end

  def create
    @listing = current_user.listings.build(listing_params)

    if @listing.save
      redirect_to @listing, notice: "Your listing is posted!"
    else
      render 'new'
    end
  end

  def update
    if @listing.update(listing_params)
      redirect_to @listing, notice: "Your listing is edited!"
    else
      render 'edit'
    end
  end

  def destroy
    @listing.destroy
    redirect_to root_path, notice: "Your listing is successfully deleted"
  end

  private

  def listing_params
    params.require(:listing).permit(:title, :description, :tags, :address, :max_guests, :price)
  end

  def find_listing
    @listing = Listing.find(params[:id])
  end

end
