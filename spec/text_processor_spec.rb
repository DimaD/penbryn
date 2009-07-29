require File.join(File.dirname(__FILE__), 'spec_helper')

describe TextProcessor do
  it "extracts sentences from text" do
    text = <<-TEXT
Down, down, down. Would the fall never come to an end! `I wonder how many miles I've fallen by this time` she said aloud.
    TEXT

    sentences = described_class.sentences_from_text(text)
    sentences.should include('Down, down, down.')
    sentences.should include('Would the fall never come to an end!')
    sentences.should include(%q[`I wonder how many miles I've fallen by this time` she said aloud.])
  end
end