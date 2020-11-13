module UserResultsHelper
  def display_result  result, total
    "#{result}/#{total}"
  end

  def display_icon_result answer
    answer.is_correct ? content_tag(:i, nil, class: "fa fa-check") :
      content_tag(:i, nil, class: "fa fa-times")
  end

  def result_announcement status
  	status ? t(".pass") : t(".fail")
  end

  def created_at_format time
    time.strftime("%d/%m/%y")
  end

  def right_answer user_answer
    user_answer.correct_answer(user_answer.question_correct_answer_id)&.content
  end
end
