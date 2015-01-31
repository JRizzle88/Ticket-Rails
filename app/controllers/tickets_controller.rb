class TicketsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_ticket
  helper_method :sort_column, :sort_direction
  respond_to :html

  def index
    # GET all tickets
    #@tickets = Ticket.all.paginate page: params[:page],
      #per_page: 15
    # Make users initally sorted by name ascending

    @tickets = Ticket.search(params[:search]).paginate(:per_page => 15, :page => params[:page]).order(sort_column + " " + sort_direction)
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @tickets }
      format.js # index.js.erb
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
    @comments = @ticket.comments
    @new_comment = @ticket.comments.new
  end

  def new
    @ticket = Ticket.new
    @ticket.ticket_status = TicketStatus.find_by_name("Open")
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      # Sends email to that is set in admin_mailer.rb
      AdminMailer.new_ticket(@ticket).deliver
      redirect_to tickets_path, :notice => "Ticket Submitted."
    else
      redirect_to tickets_path, :alert => "Unable to submit ticket."
    end
    puts @ticket.errors.inspect
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update(ticket_params)
      redirect_to tickets_path, :notice => "Ticket updated."
    else
      redirect_to edit_ticket_path, :alert => "Unable to update ticket."
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to tickets_path, :notice => "Ticket deleted."
  end

  private

    def sort_column
      Ticket.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def set_ticket
      #@ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:ticket_status_id, :user_id, :category_id, :title, :description)
    end

end
