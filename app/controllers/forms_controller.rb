class FormsController < ApplicationController

  def show
    @form = Form.find(params[:id])
  end

  def new
    @form = Form.new
  end

  def create
    @form = Form.create(form_params)

    if @form.save
      redirect_to form_path(@form)
    else
      render 'new'
    end
  end

  private

  def form_params
    params.require(:form).permit(:name, :age, :attachment, :related_form_id)
  end
end
