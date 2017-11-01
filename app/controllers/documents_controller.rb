class DocumentsController < ApplicationController

  def index
    @documents = Document.all
  end

  def new
    @documents = Document.new
  end

  def create
    @documents = Document.new(document_params)
  end

  private
  	def message_params
    	params.require(:document).permit(:title, :content)
  	end

end
