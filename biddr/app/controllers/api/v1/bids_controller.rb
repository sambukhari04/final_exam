class Api::V1::BidsController < ApplicationController

  def create
    auction =Auction.find(params[:auction_id])
    bid = auction.bids.build(bid_params)
    # bid.user = current_user

    if bid.save
      render json: auction
    else
      render json: {errors: bid.errors.full_messages}
    end
  end

  def destroy
    bid = Bid.find(params[:id])
    if bid
      bid.destroy
      render json: {success: true}
    else
      render json: {errors: ['bid not there']}
    end
  end

  private
  def find_bid
  end

  def bid_params
    params.require(:bid).permit(:price)
  end

end
