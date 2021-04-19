class ContractsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contract, only: %i[ premium show update ]

  # GET /contracts or /contracts.json
  def index
    @contracts = Contract.all
    @contract = current_user.contracts.build
  end

  # POST /contracts or /contracts.json
  def create
    @contract = Contract.new(contract_params)

    respond_to do |format|
      if @contract.save
        format.html { redirect_to contracts_path(), notice: "Contract was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_contract
    @contract = Contract.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def contract_params
    params.require(:contract).permit(:theft_coverage, :deductible, :user_id)
  end
end
