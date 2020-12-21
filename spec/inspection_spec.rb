require_relative '../lib/inspection'

describe FileChecker do
  let(:one) { FileChecker.new(['* {', '  margin: 0 ;', '  padding: 0;', '  box-sizing: border-box ;']) }
  let(:two) { FileChecker.new(['* {', '  margin: 0;', '  padding: 0;', '  box-sizing: border-box;']) }
  let(:three) { FileChecker.new(['* {', '  margin:0;', '  padding: 0;', '  box-sizing: border-box;']) }
  let(:four) do
    FileChecker.new(['* {', '  margin: 0;', '  font-family: ARS Maquette, Helvetica Neue,Arial, sans-serif;', '}'])
  end
  let(:five) { FileChecker.new(['html, body {', '  margin: 0;', '  padding: 0;', '}']) }
  let(:six) { FileChecker.new(['* {', '  margin: 0;', '  padding: 0;', '  box-sizing: border-box;']) }
  let(:seven) { FileChecker.new(['* {', '  margin: 0 ;', '  padding:0;', '  box-sizing: border-box;']) }

  describe '#examine_lines' do
    context 'Receives an array with the lines of a css file and looks for errors' do
      it "Pushes a string to the variable 'results' for each found semicolon preceeded by a space" do
        one.examine_lines
        expect(one.results.length).to eql(2)
      end

      it "Pushes a string to 'results' every time it doesn't find a space after a colon" do
        three.examine_lines
        expect(three.results.length).to eql(1)
      end

      it "Pushes a string to 'results' for each line inside curly braces, in which it doesn't find a space after a comma" do
        four.examine_lines
        expect(four.results.length).to eql(1)
      end

      it "Pushes a string to 'results' when an element of a selector list doesn't start on a new line" do
        five.examine_lines
        expect(five.results.length).to eql(1)
      end

      it "Doesn't push anything to 'results' if there are no errors" do
        two.examine_lines
        expect(two.results.length).to eql(0)
      end
    end
  end
end
