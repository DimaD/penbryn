require File.join(File.dirname(__FILE__), *%w[stanford-parser])

module SentencesExtractor
  def sentences_from_text(text)
    sentences = self.stanford_processor.get_sentences_from_text( string_to_stream(text) )
    sentences.map { |s| join_sentence(s) }
  end

  protected

  def stanford_processor
    @stanford_processor ||= Stanford::DocumentProcessor.new
  end

  def string_to_stream(str)
    java.io.StringReader.new(str)
  end

  def join_sentence(java_words)
    words = java_words.map { |jw| jw.word }

    words.inject("") do |memo, word|
      memo += if %w(' , . ! ?).include?(word) or word.match(/^'/)
                word
              else
                " #{word}"
              end
    end.lstrip
  end
end

class TextProcessor
  extend SentencesExtractor
end