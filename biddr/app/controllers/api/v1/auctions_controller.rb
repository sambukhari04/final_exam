class Api::V1::AuctionsController < Api::BaseController
  protect_from_forgery with: :null_session
  # before_action :authenticate_api_user

  def index
   auctions = Auction.order(created_at: :desc).limit(10)
   render json: auctions
  end

  def show
    auction = Auction.find params[:id]
    render json: auction
  end

  def create
    auction = Auction.new auction_params
     auction.user = @api_user
    if auction.save
      render json: @auction
    else
      render json: { errors: auction.errors.full_messages }
    end
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
    params.require(:auction).permit(:title, :details, :end_date, :price
    )
  end

  def authenticate_api_user
    @api_user = User.find_by_api_key request.headers['HTTP_API_KEY']
    head :unauthorized unless @api_user
  end

end
