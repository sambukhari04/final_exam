class AuctionsController < ApplicationController
  before_action :find_auction, only: [:show, :edit, :update, :destroy]
  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new auction_params
    @auction.user = User.all.sample

    if @auction.save
      redirect_to auction_path(@auction)
    else
      render :new
    end
  end

  def show
    # @auction = Auction.find params[:id]
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @auction }
    end
  end

  def edit
    # @auction = Auction.find params[:id]
  end

  def index
    @auctions = Auction.order(created_at: :desc)
  end

  def update
    if @auction.update auction_params
      redirect_to @auction
    else
      render :edit
    end
  end

  def destroy
    @auction.destroy
    redirect_to auctions_path
  end

  private

  def auction_params
    params.require(:auction).permit(:title, :details, :end_date, :price)
  end

  def find_auction
    @auction = Auction.find params[:id]
  end

end
