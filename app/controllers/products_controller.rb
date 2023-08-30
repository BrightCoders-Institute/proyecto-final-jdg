class ProductsController < ApplicationController
  before_action :admin?, only: %i[ edit update destroy create new]
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def add_to_cart
    @product = Product.find(params[:id])
    @cart = current_user.cart || current_user.create_cart

    line_item = @cart.line_items.find_by(product: @product)

    if line_item
      line_item.quantity += 1
    else
      line_item = @cart.line_items.build(product: @product, quantity: 1)
    end

    if line_item.save
      redirect_to products_path, notice: 'Product added to cart.'
    else
      redirect_to @product, alert: 'Failed to add product to cart.'
    end
  end

  def cart
    @cart = current_user.cart
    @line_items = @cart.line_items.includes(:product) if @cart
    @total_price = @line_items.sum { |line_item| line_item.product.total_price * line_item.quantity } if @line_items
  end

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:name, :description, :product_type, :brand_id, :image, :size, :base_price, :discount, :total_price, :stock, :availability)
  end
end
