class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Thank you, your message has been received.'
    else
      flash.now[:error] = 'Message could not be delivered, please try again.'
      render :new
    end
  end
end