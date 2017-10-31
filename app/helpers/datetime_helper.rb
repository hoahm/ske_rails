#
# /app/helpers/datetime_helper.rb
#
module DatetimeHelper
  #
  # Format date, datetime into date format.
  #
  # @param [Date] object Object must be a Date, DateTime or Time object.
  # @param [Hash] options
  #   format: I18n format
  #
  # @return [String] date in human format.
  #
  # @example
  #   format_date(Time.now)  # => "31/05/2017"
  #   format_dat(Date.today) # => "31/05/2017"
  #
  def format_date(object, options = {})
    return I18n.l(object, format: options[:format]) if object.is_a?(Date)

    I18n.l(object, format: :date_only)
  rescue I18n::ArgumentError
    ''
  end

  #
  # Format datetime.
  #
  # @param [Date] object Object must be a Date, DateTime or Time object.
  # @param [Hash] options
  #   format: I18n format
  #
  # @return [String] date in human format.
  #
  # @example
  #   format_datetime(Time.now)   # => "23:02:02 31/05/2017"
  #   format_datetime(Date.today) # => "31/05/2017"
  #
  def format_datetime(object, options = {})
    I18n.l(object, format: options[:format])
  rescue I18n::ArgumentError
    ''
  end
end
