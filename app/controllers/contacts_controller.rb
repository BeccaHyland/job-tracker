class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    @contact.company_id = params[:company_id]
    @contact.save
    redirect_to company_path(@contact.company)
  end

  def edit
    @contact = Contact.find(params[:id])
    @company = @contact.company
    # redirect_to edit_company_contact_path(@contact.company, @contact)
  end

  def destroy
    company = Company.find(params[:id])
    contact = Contact.find(params[:id])
    contact.destroy

    flash[:success] = "#{contact.name} was successfully deleted."
    redirect_to company_path(company)
  end

  def update
    @contact = Contact.find(params[:id])
    company = @contact.company
    @contact.update(contact_params)
    if @contact.save
      flash[:success] = "#{@contact.name} updated!"
      redirect_to company_path(company)
    else
      render :edit
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :position, :email)
  end
end