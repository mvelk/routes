class ContactsController < ApplicationController
  def index
    if params.has_key?(:user_id)
      @shared_contacts = User.find(params[:user_id]).shared_contacts
      @contact = Contact.where(user_id: params[:user_id]) + @shared_contacts
    else
      @contact = Contact.all
    end
    render json: @contact
  end

  # app/controller/contacts_controller.rb
  def create
    # debugger
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    contact = Contact.find_by(params[:id])
    render json: contact
  end

  def update
    contact = Contact.find_by(params[:id])
    contact.update!(contact_params)
    render json: contact
  end

  def destroy
    contact = Contact.find_by(params[:id])
    contact.destroy!
    render text: 'Contact Destroyed'
  end

  private
  def contact_params
    params.require(:contact).permit(:email, :name, :user_id)
  end
end
