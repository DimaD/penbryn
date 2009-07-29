require File.join(File.dirname(__FILE__), *%w[../vendor/stanford-parser])
module Stanford
  NLP                     = Java::edu.stanford.nlp
  DocumentProcessor       = NLP.process.DocumentPreprocessor
  WordToSentenceProcessor = NLP.process.WordToSentenceProcessor
  Sentence                = NLP.ling.Sentence
end