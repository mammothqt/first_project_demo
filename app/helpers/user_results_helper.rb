module UserResultsHelper

  def result_ratio(result, total)
    "#{result}/#{total}"
  end

  def result_icon(answer)
    answer.is_correct ? content_tag(:i, nil, class: 'fa fa-check') :
      content_tag(:i, nil, class: 'fa fa-times')
  end

  def result_announcement(status)
    status ? t('.pass') : t('.fail')
  end

  def format_date_slash(time)
    time.strftime('%d/%m/%y')
  end

  def right_answer(user_answer)
    user_answer.correct_answer&.content
  end

  def ans_by_question(test, index)
    test.questions.includes(:answers)[index].answers
  end
end
