class PrescriptionsController < ApplicationController
  before_action :current_user_must_be_prescription_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_prescription_doctor
    prescription = Prescription.find(params[:id])

    unless current_user == prescription.doctor
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Prescription.ransack(params[:q])
    @prescriptions = @q.result(:distinct => true).includes(:doctor, :patient, :event, :insurer).page(params[:page]).per(10)

    render("prescriptions/index.html.erb")
  end

  def show
    @prescription = Prescription.find(params[:id])

    render("prescriptions/show.html.erb")
  end

  def new
    @prescription = Prescription.new

    render("prescriptions/new.html.erb")
  end

  def create
    @prescription = Prescription.new

    @prescription.doctor_id = params[:doctor_id]
    @prescription.patient_id = params[:patient_id]
    @prescription.event_id = params[:event_id]
    @prescription.insurer_id = params[:insurer_id]

    save_status = @prescription.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/prescriptions/new", "/create_prescription"
        redirect_to("/prescriptions")
      else
        redirect_back(:fallback_location => "/", :notice => "Prescription created successfully.")
      end
    else
      render("prescriptions/new.html.erb")
    end
  end

  def edit
    @prescription = Prescription.find(params[:id])

    render("prescriptions/edit.html.erb")
  end

  def update
    @prescription = Prescription.find(params[:id])

    @prescription.doctor_id = params[:doctor_id]
    @prescription.patient_id = params[:patient_id]
    @prescription.event_id = params[:event_id]
    @prescription.insurer_id = params[:insurer_id]

    save_status = @prescription.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/prescriptions/#{@prescription.id}/edit", "/update_prescription"
        redirect_to("/prescriptions/#{@prescription.id}", :notice => "Prescription updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Prescription updated successfully.")
      end
    else
      render("prescriptions/edit.html.erb")
    end
  end

  def destroy
    @prescription = Prescription.find(params[:id])

    @prescription.destroy

    if URI(request.referer).path == "/prescriptions/#{@prescription.id}"
      redirect_to("/", :notice => "Prescription deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Prescription deleted.")
    end
  end
end
