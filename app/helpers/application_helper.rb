

module ApplicationHelper
    def kind_to_bootstrap_class(kind)
      case kind
      when "like"
        "btn-primary"
      when "dislike"
        "btn-danger"
      when "not_interested"
        "btn-warning"
      when "neutral"
        "btn-secondary"
      else
        "btn-secondary"
      end
    end
  end
  