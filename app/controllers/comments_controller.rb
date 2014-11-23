class CommentsController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html, :js

  def create
    @ticket = Ticket.find(params[:ticket_id])
    @comment = @ticket.comments.build(comment_params)
    if @comment.save
      @new_comment = @ticket.comments.new
      respond_to do |format|
        format.html do
          flash[:notice] = "Comment posted."
          redirect_to @ticket
        end
        format.js # Javascript response
      end
    else
      @new_comment = @comment
      respond_to do |format|
        format.html { render @ticket }
        format.js { render action: 'failed_save' }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @ticket = @comment.ticket
    @comment.destroy
    respond_to do |format|
      format.html do
        flash[:notice] = "Comment deleted."
        redirect_to @ticket
      end
      format.js # Javascript response
    end
  end

  private

  def comment_params
      params.require(:comment).permit(:body)
  end

end
