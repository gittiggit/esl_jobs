class ConversationsController < ApplicationController
  before_action :authenticate_user!
  helper_method :mailbox, :conversation
  def new
     @recipient = User.find(params[:user])  
     @ongoing_conversation = Mailboxer::Conversation.participant(current_user).where(
                        'mailboxer_conversations.id in (?)',
                        Mailboxer::Conversation.participant(@recipient).collect(&:id)
                      ).first

    if !@ongoing_conversation.blank?
      @inbox_link = mailbox_inbox_path(@ongoing_conversation)
      
      if (/inbox.\d/ === @inbox_link )
        @get_id = @inbox_link.scan(/\d+/).first 
          redirect_to mailbox_inbox_path + '?id=' + @get_id.to_s
      end
    end
  end

  def create
    recipients = User.where(id: params[:recipients])
     conversation = current_user.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation
    flash[:notice] = "Your message was successfully sent!"
    redirect_to '/mailbox/inbox?id=' + conversation.id.to_s
  end

  def show
    @receipts = conversation.receipts_for(current_user).order("created_at ASC")
    # mark conversation as read
    conversation.mark_as_read(current_user)
  end


  def reply
    current_user.reply_to_conversation(conversation, message_params[:body])
    flash[:notice] = "Your reply message was successfully sent!"
    redirect_to '/mailbox/inbox?id=' + conversation.id.to_s
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
    params.require(:message).permit(:body, :subject)
  end
end
