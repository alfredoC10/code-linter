require_relative '../lib/file_reading'

describe Opening do
  describe '#pick_lines' do
    let(:v) { Opening.new('./css/sample_good.css') }
    it 'Opens a file, read it and returns a string array with the lines of the file' do
      expect(v.pick_lines[1, 2]).to eql(['  margin: 0;', '  padding: 0;'])
    end
  end
end
