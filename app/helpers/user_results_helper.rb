module UserResultsHelper
  def display_result  result, total
  	"#{result}/#{total}"
  end

  def display_icon_result answer
    answer.is_correct ? content_tag(:i, nil, class: "fa fa-check") :
      content_tag(:i, nil, class: "fa fa-times")
  end
end
