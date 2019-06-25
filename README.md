# PdfExtractor

Extracts PDF information via [PDFtk](https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/)

## Dependencies

* [PDFtk](https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pdf_extractor'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pdf_extractor

## Usage

```ruby
require 'pdf_extractor'
form = PdfExtractor.dump_data_fields("~/Downloads/testing_pdf.pdf")
puts form.first.inspect
# => {"FieldType"=>"Text", "FieldName"=>"customerNumber", "FieldNameAlt"=>"Customer ID number", "FieldFlags"=>"12582912", "FieldValue"=>"ID0000011", "FieldJustification"=>"Left"}
```

or

```ruby
form = PdfExtractor.dump_data_fields_key_value("test/fixtures/testing_pdf.pdf")
puts form.inspect
# => {"customerNumber"=>"ID0000011"}
```

or

```ruby
meta = PdfExtractor.dump_data("test/fixtures/testing_pdf.pdf")
puts meta.inspect
# => {"Creator"=>"PDFescape Online - https://www.pdfescape.com", "Title"=>"testing_pdf", "Producer"=>"RAD PDF 3.9.6.0 - https://www.radpdf.com", "ModDate"=>"D:20190625142342Z", "CreationDate"=>"D:20190625142056Z", "PdfID0"=>"fd1f5ca5bedbac4d46fa47241f696430", "PdfID1"=>"fd1f5ca5bedbac4d46fa47241f696430", "NumberOfPages"=>"1", "PageMediaNumber"=>"1", "PageMediaRotation"=>"0", "PageMediaRect"=>"0 0 595.28 841.89", "PageMediaDimensions"=>"595.28 841.89"}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jindrichskupa/pdf_extractor.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
