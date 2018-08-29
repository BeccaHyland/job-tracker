class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    @contact.company_id = params[:company_id]
    @contact.save
    redirect_to company_path(@contact.company)
  end

  def edit
    @contact = Contact.find(params[:id])
    redirect_to edit_contact_path(@contact.company)
  end

  def destroy
    company = Company.find(params[:id])
    contact = Contact.find(params[:id])
    contact.destroy
    
    flash[:success] = "#{contact.name} was successfully deleted."
    redirect_to company_path(company)
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :position, :email)
  end
end