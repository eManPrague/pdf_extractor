# frozen_string_literal: true

module PdfExtractor
  # Parse PDFTk outputs
  class OutputParser
    def self.dump_data(output = nil)
      fields = {}
      pending_key = pending_value = nil
      output.each do |line|
        key, value = line.split(': ').map(&:strip)
        next if %w[InfoBegin PageMediaBegin].include? key

        if key == 'InfoKey'
          pending_key = value
          if both_not_nil?(pending_key, pending_value)
            fields[pending_key] = pending_value
            pending_key = pending_value = nil
          end
        elsif key == 'InfoValue'
          pending_value = value
          if both_not_nil?(pending_key, pending_value)
            fields[pending_key] = pending_value
            pending_key = pending_value = nil
          end
        else
          fields[key] = value
        end
      end
      fields
    end

    def self.dump_data_fields(output = nil)
      return if output.nil?

      fields = []
      field = {}
      output.each do |line|
        if line.strip == '---'
          fields << field unless field.empty?
          field = {}
        else
          key, value = line.split(': ')
          field[key] = value.strip
        end
      end
      fields << field unless field.empty?
      fields
    end

    def self.dump_data_fields_key_value(output = nil)
      field_array = dump_data_fields(output)
      return if field_array.empty?

      form = field_array.map { |i| { i['FieldName'] => i['FieldValue'] } }.each {  hash }
      Hash[*form.collect(&:to_a).flatten]
    end

    def self.both_not_nil?(a = nil, b = nil)
      !a.nil? && !b.nil?
    end

  end
end
