
class TestController < ApplicationController

  def index
    respond_to do |format|
      format.html { render :template => "test/test" }
    end
  end
end