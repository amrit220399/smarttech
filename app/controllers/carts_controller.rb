
class CartsController < ApplicationController
  before_action :set_cart, only: %i[ show edit update destroy ]
  require "active_merchant/billing/rails"
  # GET /carts or /carts.json
  def index
    @carts = Cart.all
  end

  def empty
  end

  def purchase_complete
  end
  
  def checkout
    
  	if request.post?

      amount = session[:amount]
  ActiveMerchant::Billing::Base.mode = :test
  
  # Create a new credit card object
  credit_card = ActiveMerchant::Billing::CreditCard.new(
    :number     => params[:cardnumber],
    :month      => params[:month],
    :year       => params[:year],
    :first_name => params[:cardname],
    :last_name  => params[:cardname],
    :verification_value  => params[:cvv]
  )
  
  
  if credit_card.valid?
    # Create a gateway object to the TrustCommerce service
    gateway = ActiveMerchant::Billing::TrustCommerceGateway.new(
      :login    => 'TestMerchant',
      :password => 'password'
    )
  
  
  
    # Authorize for $10 dollars (1000 cents)
    response = gateway.authorize(amount.to_i, credit_card)
  
    if response.success?
      # Capture the money
      #Triger the mailer
      session[:cart]=nil
      gateway.capture(amount.to_i, response.authorization)
      redirect_to :action=>:purchase_complete
    end
    else
      flash[:notice] = "Invalid credit card. Give proper inputs"
      render :action=>:checkout
    end
   end
  end
  # GET /carts/1 or /carts/1.json
  def show
    begin
      @cart = Cart.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to @cart, :notice => 'Invalid Cart'
      else
        respond_to do |format|
          format.html # show.html.erb
        end
      end
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts or /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: "Cart was successfully created." }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: "Cart was successfully updated." }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: "Cart was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.fetch(:cart, {})
    end
end
