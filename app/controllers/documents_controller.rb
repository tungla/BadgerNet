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

  def upload
    @person=User.all
    uploaded_io = params[:Document]
    File.open(Rails.root.join('public',uploaded_io.original_filename), 'wb') do |file|
    file.write(uploaded_io.read)
    end
  end

end
