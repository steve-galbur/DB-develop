class AppointmentController < ApplicationController
  
    def index
      @appointments = Appointment.includes(:physician, :patient)
      
      #one way of querying with 2 calls
      active_statuses = Status.where(active: false).pluck(:id)
      @appointments = Appointment.where(status_id: active_statuses).includes(:physician, :patient) 

      #2nd way of querying with 1 call
      @appointments = Appointment.joins(:status).where(statuses: {active: false}).includes(:physician, :patient)
      
      #3rd way use of scope see model
      @appointments = Appointment.joins(:status).where(statuses: {id: Status.inactive.pluck(:id)}).includes(:physician, :patient)
    end
  
  end
