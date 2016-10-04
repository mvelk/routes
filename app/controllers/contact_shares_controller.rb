class ContactSharesController < ApplicationController
  def index
    @contact_share = ContactShare.all
    render json: @contact_share
  end

  # app/controller/contact_shares_controller.rb
  def create
    # debugger
    contact_share = ContactShare.new(contact_share_params)
    if contact_share.save
      render json: contact_share
    else
      render(
        json: contact_share.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    contact_share = ContactShare.find_by(params[:id])
    render json: contact_share
  end

  def destroy
    contact_share = ContactShare.find_by(params[:id])
    contact_share.destroy!
    render text: 'ContactShare Destroyed'
  end

  private
  def contact_share_params
    params.require(:contact_share).permit(:user_id, :contact_id)
  end
end
