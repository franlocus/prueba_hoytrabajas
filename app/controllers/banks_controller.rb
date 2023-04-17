class BanksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bank, only: %i[show edit update destroy]

  # GET /banks
  def index
    @pagy, @banks = pagy(Bank.order(created_at: :desc), items: 10)
  end

  # GET /banks/1
  def show
  end

  # GET /banks/new
  def new
    @bank = Bank.new
  end

  # GET /banks/1/edit
  def edit
  end

  # POST /banks
  def create
    @bank = Bank.new(bank_params)

    if @bank.save
      redirect_to @bank, notice: t('bank.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /banks/1
  def update
    if @bank.update(bank_params)
      redirect_to @bank, notice: t('bank.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /banks/1
  def destroy
    @bank.destroy
    redirect_to banks_url, notice: t('bank.destroyed')
  end

  private

  def set_bank
    @bank = Bank.find(params[:id])
  end

  def bank_params
    params.require(:bank).permit(:name)
  end
end
