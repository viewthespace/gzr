# The MIT License (MIT)

# Copyright (c) 2018 Mike DeAngelo Looker Data Sciences, Inc.

# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# frozen_string_literal: true

require_relative 'subcommandbase'

module Gzr
  module Commands
    class Look < SubCommandBase

      namespace :look

      desc 'rm LOOK_ID', 'Delete look given by LOOK_ID'
      method_option :help, aliases: '-h', type: :boolean,
                           desc: 'Display usage information'
      def rm(look_id)
        if options[:help]
          invoke :help, ['rm']
        else
          require_relative 'look/rm'
          Gzr::Commands::Look::Rm.new(look_id, options).execute
        end
      end

      desc 'import FILE DEST_SPACE_ID', 'Import a look from a file'
      method_option :help, aliases: '-h', type: :boolean,
                           desc: 'Display usage information'
      method_option :plain, type: :boolean,
                           desc: 'Provide minimal response information'
      def import(file,dest_space_id)
        if options[:help]
          invoke :help, ['import']
        else
          require_relative 'look/import'
          Gzr::Commands::Look::Import.new(file, dest_space_id, options).execute
        end
      end

      desc 'cat LOOK_ID', 'Output the JSON representation of a look to the screen or a file'
      method_option :help, aliases: '-h', type: :boolean,
                           desc: 'Display usage information'
      method_option :dir,  type: :string,
                           desc: 'Directory to store output file'
      method_option :plans,  type: :boolean,
                           desc: 'Include scheduled plans'
      def cat(look_id)
        if options[:help]
          invoke :help, ['cat']
        else
          require_relative 'look/cat'
          Gzr::Commands::Look::Cat.new(look_id, options).execute
        end
      end
    end
  end
end
