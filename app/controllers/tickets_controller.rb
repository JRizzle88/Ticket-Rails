class TicketsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_ticket

  respond_to :html

  def index
    @tickets = Ticket.includes(:category, :user, :ticket_status)
    #authorize User
  end

  def show
    @ticket = Ticket.find(params[:id])
    #authorize @user
  end

  def new
    @ticket = Ticket.new()
    @ticket.ticket_status = TicketStatus.find_by_name("Open")
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.save
  end

  def update
    @ticket = Ticket.find(params[:id])
    authorize @user
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    authorize user
    @ticket.destroy
  end

  private
    def set_ticket
    #  @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params[:ticket]
    end
end
