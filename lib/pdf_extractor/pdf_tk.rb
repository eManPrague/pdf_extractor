# frozen_string_literal: true

module PdfExtractor
  # Call PDFTk with params
  class PdfTk
    def self.dump_data_fields(file = nil)
      return if file.nil?

      command = IO.popen("pdftk #{file} dump_data_fields", 'r+')
      command.readlines
    end

    def self.dump_data(file = nil)
      return if file.nil?

      command = IO.popen("pdftk #{file} dump_data", 'r+')
      command.readlines
    end
  end
end
