#!/usr/bin/env jruby
require 'vendor/stanford-parser.jar'

DocumentProcessor = Java::edu.stanford.nlp.process.DocumentPreprocessor
WordToSentenceProcessor = Java::edu.stanford.nlp.process.WordToSentenceProcessor
Sentence = Java::edu.stanford.nlp.ling.Sentence

def to_stream(str)
  java.io.StringReader.new(str)
end

def join_sentence(words)
  words.inject("") do |memo, word|
    memo += if %w(' , . ! ?).include?(word) or word.match(/^'/)
              word
            else
              " #{word}"
            end
  end.lstrip
end

processor = DocumentProcessor.new
res = processor.get_sentences_from_text( to_stream("`I wonder how many miles I've fallen by this time` she said aloud") )

p res.to_string # => "[[Mr., Fry, ,, wtf, ?], [I, am, a, new, sentence, .], [I, 'll, post, about, it, later, .]]"

res.each do |s|
  puts join_sentence( s.map { |java_w| java_w.word } )
end
