require "test_helper"

class PdfExtractorTest < Minitest::Test
  def test_that_it_has_a_version_number
    assert_not_nil ::PdfExtractor::VERSION
  end

  def test_form_field_name
    form = PdfExtractor.dump_data_fields("test/fixtures/testing_pdf.pdf")
    field = form.select { |s| s['FieldName'] == 'customerNumber' }
    assert_not field.empty?
  end

  def test_form_field_name_key_value
    form = PdfExtractor.dump_data_fields_key_value("test/fixtures/testing_pdf.pdf")
    assert_not form['customerNumber'].nil?
  end

  def test_form_field_value
    form = PdfExtractor.dump_data_fields("test/fixtures/testing_pdf.pdf")
    field = form.select { |s| s['FieldName'] == 'customerNumber' }
    assert field.first['FieldValue'] == 'ID0000011'
  end

  def test_form_field_value_key_value
    form = PdfExtractor.dump_data_fields_key_value("test/fixtures/testing_pdf.pdf")
    assert form['customerNumber'] == 'ID0000011'
  end

  def test_pdf_title
    meta = PdfExtractor.dump_data("test/fixtures/testing_pdf.pdf")
    assert meta['Title'] == 'testing_pdf'
  end

end
