class CustomersController < ApplicationController
  before_action :set_costumer, only: %i[show update destroy]

  def index
    @customer = Customer.all
    render json: @customer
  end
  

  def show
    render json: @customer
  end

  def create 
    @customer = Customers.new(customer_params)

    if @customer.save
      render json: @customer, status: :created, location: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  def update
    if @customer.update(costumer_params)
      render json: @customer
    else 
      render json: @customer, status: :unprocessable_entity
    end
  end

  def destroy
    @customer.destroy
    head :no_content
  end

  private 
  
  def set_customer
    @customer= Customers.find(params[:id])
  end 

  def customer_params
    params.require(:customers).permit(:name, :phone, :email)
  end
end
