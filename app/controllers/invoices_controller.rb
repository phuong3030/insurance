class InvoicesController < ApplicationController
  before_action :authenticate_user!

  # GET /invoices or /invoices.json
  def index
    @invoices = Invoice.all
    contract = Contract.find(params[:contract_id])
    @invoice = contract.invoices.build
  end

  # POST /invoices or /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to contract_invoices_path(params[:contract_id]) }
      else
        format.html { redirect_to contract_invoices_path(params[:contract_id]), error: "Invoice was not successfully created." }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def invoice_params
      params.require(:invoice).permit(:contract_id)
    end
end
