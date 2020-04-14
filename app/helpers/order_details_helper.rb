module OrderDetailsHelper
  def detail_current_user(detail)
    if detail.user.id == current_user.id
      'You'
    else
      detail.user.name
    end
  end

  def comment_belong_to_current_user(comment)
    comment.user.id == session[:id]
  end
end