class BrokerRelationsController < ApplicationController
  def index
    @q = BrokerRelation.ransack(params[:q])
    @broker_relations = @q.result(:distinct => true).includes(:patient, :insurer).page(params[:page]).per(10)

    render("broker_relations/index.html.erb")
  end

  def show
    @broker_relation = BrokerRelation.find(params[:id])

    render("broker_relations/show.html.erb")
  end

  def new
    @broker_relation = BrokerRelation.new

    render("broker_relations/new.html.erb")
  end

  def create
    @broker_relation = BrokerRelation.new

    @broker_relation.patient_id = params[:patient_id]
    @broker_relation.insurer_id = params[:insurer_id]
    @broker_relation.insurance_company = params[:insurance_company]
    @broker_relation.permission = params[:permission]

    save_status = @broker_relation.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/broker_relations/new", "/create_broker_relation"
        redirect_to("/broker_relations")
      else
        redirect_back(:fallback_location => "/", :notice => "Broker relation created successfully.")
      end
    else
      render("broker_relations/new.html.erb")
    end
  end

  def edit
    @broker_relation = BrokerRelation.find(params[:id])

    render("broker_relations/edit.html.erb")
  end

  def update
    @broker_relation = BrokerRelation.find(params[:id])

    @broker_relation.patient_id = params[:patient_id]
    @broker_relation.insurer_id = params[:insurer_id]
    @broker_relation.insurance_company = params[:insurance_company]
    @broker_relation.permission = params[:permission]

    save_status = @broker_relation.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/broker_relations/#{@broker_relation.id}/edit", "/update_broker_relation"
        redirect_to("/broker_relations/#{@broker_relation.id}", :notice => "Broker relation updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Broker relation updated successfully.")
      end
    else
      render("broker_relations/edit.html.erb")
    end
  end

  def destroy
    @broker_relation = BrokerRelation.find(params[:id])

    @broker_relation.destroy

    if URI(request.referer).path == "/broker_relations/#{@broker_relation.id}"
      redirect_to("/", :notice => "Broker relation deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Broker relation deleted.")
    end
  end
end
