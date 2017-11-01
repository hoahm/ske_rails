module HistoryHelper
  def track_change(version)
    return unless version.event == 'update'
    html = "<ul>"
    version.changeset.each do |atrib, value|
      html += "<li><strong>#{atrib}</strong>: "
      html += value[0].blank? ? "empty -> " : "\"#{value[0]}\" -> "
      html += "\"#{value[1]}\""
    end
    html += "</li></ul>"
    html.html_safe
  end

  def history_event(version)
    color = case version.event
            when 'create'
              'muted'
            when 'update'
              'primary'
            when 'destroy'
              'danger'
            end
    "<span class=\"text-#{color}\">#{version.event}</span>".html_safe
  end
end
