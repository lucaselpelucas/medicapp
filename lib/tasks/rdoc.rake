require 'rdoc/task'

RDoc::Task.new :rdoc do |rdoc|
  rdoc.main = "README.doc"
  rdoc.rdoc_files.include("README.rdoc", "lib/   *.rb")
  rdoc.options << "--all"
end
