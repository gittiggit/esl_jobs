class ConversationsController < ApplicationController
  before_action :authenticate_user!
 helper_method :mailbox, :conversation
  def new
    @recipient = User.find(params[:user]) 
    @ongoing_conversation_sent = mailbox.sentbox.participant(current_user).participant(@recipient).first(1) 
    @ongoing_conversation_inbox = mailbox.inbox.participant(current_user).participant(@recipient).first(1)
    if !@ongoing_conversation_inbox.blank?
    redirect_to conversation_path(@ongoing_conversation_inbox)
    elsif !@ongoing_conversation_sent.blank?
    redirect_to conversation_path(@ongoing_conversation_sent)
    end
  end

  def create
    recipients = User.where(id: params[:recipients])
     conversation = current_user.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation
    flash[:notice] = "Your message was successfully sent!"
    redirect_to conversation_path(conversation)
  end

  def show
    @receipts = conversation.receipts_for(current_user).order("created_at ASC")
    # mark conversation as read
    conversation.mark_as_read(current_user)
  end


  def reply
    current_user.reply_to_conversation(conversation, message_params[:body])
    flash[:notice] = "Your reply message was successfully sent!"
    redirect_to conversation_path(conversation)
  end

  def trash
    conversation.move_to_trash(current_user)
    redirect_to mailbox_inbox_path
  end

  def untrash
    conversation.untrash(current_user)
    redirect_to mailbox_inbox_path
  end


  private

  def conversation_params
    params.require(:conversation).permit(:subject, :body,recipients:[])
  end

  def message_params
    params.require(:conversation).permit(:subject, :body,recipients:[])
  end
end
