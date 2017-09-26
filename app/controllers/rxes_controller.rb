class RxesController < ApplicationController
  def index
    @q = Rx.ransack(params[:q])
    @rxes = @q.result(:distinct => true).page(params[:page]).per(10)

    render("rxes/index.html.erb")
  end

  def show
    @rx = Rx.find(params[:id])

    render("rxes/show.html.erb")
  end

  def new
    @rx = Rx.new

    render("rxes/new.html.erb")
  end

  def create
    @rx = Rx.new

    @rx.prescription_id = params[:prescription_id]
    @rx.drug = params[:drug]
    @rx.dose = params[:dose]
    @rx.quantity = params[:quantity]
    @rx.units = params[:units]
    @rx.details = params[:details]
    @rx.time_spread = params[:time_spread]
    @rx.time_spread_unit = params[:time_spread_unit]

    save_status = @rx.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/rxes/new", "/create_rx"
        redirect_to("/rxes")
      else
        redirect_back(:fallback_location => "/", :notice => "Rx created successfully.")
      end
    else
      render("rxes/new.html.erb")
    end
  end

  def edit
    @rx = Rx.find(params[:id])

    render("rxes/edit.html.erb")
  end

  def update
    @rx = Rx.find(params[:id])

    @rx.prescription_id = params[:prescription_id]
    @rx.drug = params[:drug]
    @rx.dose = params[:dose]
    @rx.quantity = params[:quantity]
    @rx.units = params[:units]
    @rx.details = params[:details]
    @rx.time_spread = params[:time_spread]
    @rx.time_spread_unit = params[:time_spread_unit]

    save_status = @rx.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/rxes/#{@rx.id}/edit", "/update_rx"
        redirect_to("/rxes/#{@rx.id}", :notice => "Rx updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Rx updated successfully.")
      end
    else
      render("rxes/edit.html.erb")
    end
  end

  def destroy
    @rx = Rx.find(params[:id])

    @rx.destroy

    if URI(request.referer).path == "/rxes/#{@rx.id}"
      redirect_to("/", :notice => "Rx deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Rx deleted.")
    end
  end
end
