class TableController < ApplicationController
  def index
    # file = File.read("db/data.json")
    # @elements = JSON.parse(file)
    @elements = Element.all
  end

  def show
    @element = Element.find(params[:id])
  end
end
