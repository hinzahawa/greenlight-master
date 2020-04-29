class CodeidsController < ApplicationController
  
  def index
    # @codeid = Codeid.search(params[:search])
    # if @codeid.class == Array
    #   @codeid = Kaminari.paginate_array(@codeid).page(params[:page]).per(100) 
    # else
    #   @codeid = @codeid.page(params[:page]).per(10)
    # end
    if !params[:search].nil?
      @codeid = Codeid.where(invite_code: params[:search])
      .or(Codeid.where(sale_name: params[:search])).page(params[:page]).per(100) 
      @button = true
      p @codeid
    else
      @codeid = Codeid.order(:id).page(params[:page]).per(100) 
      @button = false
    end
    

  end

  def show
    # @data = Codeid.find_by_id(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
  end


end
