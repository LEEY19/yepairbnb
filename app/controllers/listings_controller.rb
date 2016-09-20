class ListingsController < ApplicationController
  before_action :find_listing, except: [:search, :index, :new, :create]

  def index
  
    if params[:search].present?
      params[:pet_presence_list] = "No" if !params[:pet_presence_list].present?
      @listings = Listing.search(params[:search], params[:pet_presence_list]) 
    else
      @listings = Listing.all.order('created_at DESC')
    end

    if params[:search].present?
      if @listings.present?
        flash[:notice] = "Here are the PairBnB listings relevant to your filter"
      else
        flash[:notice] = "There are no PairBnB listings relevant to your filter, please refine your filtering"
      end
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
      @listing.keyword_description_list.add(listing_params[:keyword_description_list])
      @listing.pet_presence_list.add(listing_params[:pet_presence_list])
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
    params.require(:listing).permit(:title, :description, :tags, :address, :max_guests, :price, :keyword_description_list, :pet_presence_list)
  end

  def find_listing
    @listing = Listing.find(params[:id])
  end

end
