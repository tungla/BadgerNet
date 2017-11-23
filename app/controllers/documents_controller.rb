# document controller
class DocumentsController < ApplicationController
  def index
    @documents = Document.all
    @document = Document.new
    if current_user.has_role? :coach
      render 'admin_index'
    else
      render
    end
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      flash[:success] = 'Document uploaded'
    else
      flash[:alert] = 'Document cannot be uploaded'
    end
    redirect_to documents_path
  end

  def destroy
    begin
      Document.find(params[:id]).destroy
      flash[:success] = 'Document deleted'
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = 'Could not find this document'
    end
    redirect_to documents_path
  end

  private

  def document_params
    params.require(:document).permit(:name, :attachment)
  end
end
