class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
   @clients = policy_scope(Client).all
   @my_clients = Client.where(user_id: current_user)
  end

  def show

  end

  def new
    @client = Client.new
    authorize(@client)
  end

  def create
    @client = Client.new(client_params)
    @client.user = current_user
    authorize(@client)
    if @client.save
      redirect_to clients_path(@client)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @client.update(client_params)
    redirect_to clients_path
  end

  def destroy
    @client.destroy
    redirect_to clients_path
  end

  private

  def set_client
    @client = Client.find(params[:id])
    authorize @client
  end

  def client_params
    params.require(:client).permit(:name, :siret_num, :address, :phone_number, :email)
  end
end
