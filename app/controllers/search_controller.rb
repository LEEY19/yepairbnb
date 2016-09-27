class SearchController < ApplicationController
  def index

    if params[:query].present?
      @listings = Listing.search(params[:query], suggest: true)
    else
      @listings = []
    end
  end

  def autocomplete

    render json: Listing.search(params[:query], limit: 10).map {|listing| {title: listing.title}}
  end


  def search
    if params[:search].values.include? ""
      flash[:notice] = "Please input a valid search"
      redirect_to root_path
    else
    @relevant_location = Listing.search params[:search][:location], fields: [:address], misspellings: {below: 5, edit_distance: 2}
    @final_relevant = []
    a = Date.parse(params[:search][:bookingstartdate])
    d = Date.parse(params[:search][:bookingenddate])
    @relevant_location.to_a.each do |listing|
      if listing.max_guests >= params[:search][:no_guest][0].to_i
        array = []
        listing.reservations.pluck(:start, :end).each do |x|
          array << [*(x[0].next...x[1])]
        end
        if (array.flatten & [a, d]).empty?
          @final_relevant << listing
        end
      end
    end

    flash[:notice] = "Here are listings relevant to your search"
    end

  end
end
