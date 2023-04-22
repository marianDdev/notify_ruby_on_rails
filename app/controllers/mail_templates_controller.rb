class MailTemplatesController < ApplicationController
  before_action :set_mail_template, only: %i[ show edit update destroy ]

  def index
    @mail_templates = MailTemplate.all
  end

  def show
  end

  def new
    @mail_template = MailTemplate.new
  end

  def edit
  end

  def create
    @mail_template = MailTemplate.new(mail_template_params)

    respond_to do |format|
      if @mail_template.save
        format.html { redirect_to mail_template_url(@mail_template), notice: "Mail template was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @mail_template.update(mail_template_params)
        format.html { redirect_to mail_template_url(@mail_template), notice: "Mail template was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @mail_template.destroy

    respond_to do |format|
      format.html { redirect_to mail_templates_url, notice: "Mail template was successfully destroyed." }
    end
  end

  private
    def set_mail_template
      @mail_template = MailTemplate.find(params[:id])
    end

    def mail_template_params
      params.require(:mail_template).permit(:subject, :message, :signature)
    end
end
