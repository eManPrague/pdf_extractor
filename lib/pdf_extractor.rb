# frozen_string_literal: true

require 'pdf_extractor/version'
require 'pdf_extractor/pdf_tk'
require 'pdf_extractor/output_parser'

# PdfExtractor module to extract PDF form data
module PdfExtractor
  class Error < StandardError; end
  # Your code goes here...
  def self.dump_data_fields(file = nil)
    output = PdfTk.dump_data_fields(file)
    OutputParser.dump_data_fields(output)
  end

  def self.dump_data_fields_key_value(file = nil)
    output = PdfTk.dump_data_fields(file)
    OutputParser.dump_data_fields_key_value(output)
  end

  def self.dump_data(file = nil)
    output = PdfTk.dump_data(file)
    OutputParser.dump_data(output)
  end
end
