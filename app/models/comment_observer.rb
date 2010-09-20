class CommentObserver < ActiveRecord::Observer

  def  after_create(comment)
    @comments=comment.ancestors
    @comments.push(comment)
    @users=find_users(@comments)
    puts "en observer"
    @users.each do |user|
       Notifier.deliver_new_comment(user)
    end
    puts "paso"
  end


  private
  
  def find_users(comments)
    @users=[]
    comments.each do |comment|
      if(!@users.include?(comment.user))
        @users.push(comment.user)
      end
    end
    @users
  end

  handle_asynchronously :after_create
end
