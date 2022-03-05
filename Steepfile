target :sample do
  check "sample.rb"
  signature "sample.rbs"

  configure_code_diagnostics(Steep::Diagnostic::Ruby.all_error)
  # configure_code_diagnostics do |hash|
  #   hash[Steep::Diagnostic::Ruby::MethodDefinitionMissing] = nil
  #   hash[Steep::Diagnostic::Ruby::UnsupportedSyntax] = nil
  # end
end
