class CommentObserver < ActiveRecord::Observer

  def  after_create(comment)
	puts comment.parent_id.nil?
    if comment.parent_id.nil?
       Notifier.deliver_new_comment(comment)
    else

    end
  end

end

