require 'boardprinter'

class BoardPrinterClass
end
​
before(:each) do
  @dummy_class = BoardPrinterClass.new
  @dummy_class.extend(BoardPrinter)
end
​
describe BoardPrinterClass do

  it

end