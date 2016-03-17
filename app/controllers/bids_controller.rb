class BidsController < ApplicationController

  def create
    @bid = Bid.new(bid_params)

    unless @bid.save
      @item = @bid.item
      render "items/show"
    end

    @bid_new = Bid.new(item: @bid.item, amount: @bid.item.next_bid_amount)
  end


  private
    # Only allow a trusted parameter "white list" through.
    def bid_params
      params.require(:bid).permit(:amount, :item_id)
    end
end
