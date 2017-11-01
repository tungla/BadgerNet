# DocumentsController: handles documents
class DocumentsController < ApplicationController
  def index
    @documents = Document.all
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
  end

  private

  def message_params
    params.require(:document).permit(:title, :content)
  end
end
