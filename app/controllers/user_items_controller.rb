class UserItemsController < ApplicationController

  def index
    @collection = case params[:collection]
      when "trade"
        :willtrade
      when "want"
        :want
      else
        :own_count
    end
    @items = Item.find(@user.user_items.where.not(@collection => 0).collect {|f| f.item_id})
  end

  # GET /user_items/1 or /user_items/1.json
  def show
    @user_item = UserItem.find(params[:id])
  end

  private
    # Only allow a list of trusted parameters through.
    def user_item_params
      params.require(:user_item).permit(:own_count, :willtrade, :want, :hidden)
    end

    def user_item_params
      params.permit(:collection)
    end
end
