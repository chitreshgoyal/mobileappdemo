class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
   before_filter :require_user, :only => [:index, :show, :edit, :update, :delete]
#   protect_from_forgery :except => [:create, :update, :delete]
 
  def index
    @products = Product.all
    @users = Product.find(:all)
      #--------amazon cloud search-----------------------------------------------------------
      #searcher = CloudSearch::Searcher.new
      #@resp     = searcher.with_fields(:id, :actor, :director, :title, :year, :text_relevance)
      #         .with_query("star wars")
      #         .search
      #--------------------------------------------------------------------------------------
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @products }
      format.xml { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    #-------------------------------------------------------------------------------------------
    document = CloudSearch::Document.new(:type    => "add", # or "delete"
                                         :version => 12345,
                                         :id      => 679,
                                         :lang    => :en,
                                         :fields  => {
                                                 :actor => ["PSI Marques", "WilPSI Fernandes"], 
                                                 :director => ["PSI, George"], 
                                                 :text_relevance => '309',
                                                 :title => "Star Wars"}) 
    
    indexer = CloudSearch::Indexer.new
    indexer << document # add as many documents as you want (CloudSearch currently sets a limit of 5MB per documents batch)
    #sindexer.index
    render :text =>'<pre>'+CloudSearch.config.document_url.to_yaml and return true 
    #-------------------------------------------------------------------------------------------
    #@product = Product.new
    
    #respond_to do |format|
    #  format.html # new.html.erb
    #  format.json { render json: @product }
    #end

  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.xml  { head :ok }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
  
  def dbaction
    #called for all db actions
    first_name = params["c0"]
    last_name  = params["c1"]
    phone      = params["c2"]

    @mode = params["!nativeeditor_status"]

    @id = params["gr_id"]
    case @mode
      when "inserted"
        user = Product.new
        user.name = name
        user.price = price
        user.save!  
        @tid = user.id
      when "deleted"
        user=Product.find(@id)
        user.destroy
        @tid = @id
      when "updated"
        user=Product.find(@id)
        user.name = name
        user.price = price
        user.save!
        @tid = @id
    end 
  end
  
  def product_info
    @product_detail = Product.find_by_name(params["name"])
  end

end
