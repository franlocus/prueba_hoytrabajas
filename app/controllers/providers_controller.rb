class ProvidersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_provider, only: %i[show edit update destroy]

  # GET /providers
  def index
    @pagy, @providers = pagy(Provider.order(created_at: :desc), items: 10)
  end

  # GET /providers/1
  def show
  end

  # GET /providers/new
  def new
    @provider = Provider.new
  end

  # GET /providers/1/edit
  def edit
  end

  # POST /providers
  def create
    @provider = Provider.new(provider_params)

    if @provider.save
      redirect_to @provider, notice: t('provider.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /providers/1
  def update
    if @provider.update(provider_params)
      redirect_to @provider, notice: t('provider.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /providers/1
  def destroy
    @provider.destroy
    redirect_to providers_url, notice: t('provider.destroyed')
  end

  private

  def set_provider
    @provider = Provider.find(params[:id])
  end

  def provider_params
    params.require(:provider).permit(:name, :nit, :contact_person_name, :contact_person_number, :bank_name, :bank_account_number)
  end
end
