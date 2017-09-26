class BrokerProfilesController < ApplicationController
  def index
    @q = BrokerProfile.ransack(params[:q])
    @broker_profiles = @q.result(:distinct => true).includes(:inusrer).page(params[:page]).per(10)

    render("broker_profiles/index.html.erb")
  end

  def show
    @broker_profile = BrokerProfile.find(params[:id])

    render("broker_profiles/show.html.erb")
  end

  def new
    @broker_profile = BrokerProfile.new

    render("broker_profiles/new.html.erb")
  end

  def create
    @broker_profile = BrokerProfile.new

    @broker_profile.phone_work = params[:phone_work]
    @broker_profile.address_work = params[:address_work]
    @broker_profile.city_work = params[:city_work]
    @broker_profile.zip_work = params[:zip_work]
    @broker_profile.state_work = params[:state_work]
    @broker_profile.country_work = params[:country_work]
    @broker_profile.phone_mobile = params[:phone_mobile]
    @broker_profile.practice_name = params[:practice_name]
    @broker_profile.company = params[:company]
    @broker_profile.insurer_id = params[:insurer_id]
    @broker_profile.photo = params[:photo]
    @broker_profile.job_title = params[:job_title]

    save_status = @broker_profile.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/broker_profiles/new", "/create_broker_profile"
        redirect_to("/broker_profiles")
      else
        redirect_back(:fallback_location => "/", :notice => "Broker profile created successfully.")
      end
    else
      render("broker_profiles/new.html.erb")
    end
  end

  def edit
    @broker_profile = BrokerProfile.find(params[:id])

    render("broker_profiles/edit.html.erb")
  end

  def update
    @broker_profile = BrokerProfile.find(params[:id])

    @broker_profile.phone_work = params[:phone_work]
    @broker_profile.address_work = params[:address_work]
    @broker_profile.city_work = params[:city_work]
    @broker_profile.zip_work = params[:zip_work]
    @broker_profile.state_work = params[:state_work]
    @broker_profile.country_work = params[:country_work]
    @broker_profile.phone_mobile = params[:phone_mobile]
    @broker_profile.practice_name = params[:practice_name]
    @broker_profile.company = params[:company]
    @broker_profile.insurer_id = params[:insurer_id]
    @broker_profile.photo = params[:photo]
    @broker_profile.job_title = params[:job_title]

    save_status = @broker_profile.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/broker_profiles/#{@broker_profile.id}/edit", "/update_broker_profile"
        redirect_to("/broker_profiles/#{@broker_profile.id}", :notice => "Broker profile updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Broker profile updated successfully.")
      end
    else
      render("broker_profiles/edit.html.erb")
    end
  end

  def destroy
    @broker_profile = BrokerProfile.find(params[:id])

    @broker_profile.destroy

    if URI(request.referer).path == "/broker_profiles/#{@broker_profile.id}"
      redirect_to("/", :notice => "Broker profile deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Broker profile deleted.")
    end
  end
end
