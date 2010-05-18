module Inkling
  USAGE = <<END
Inkling #{Inkling::VERSION}

Usage:  inkling command  [ options ... ]

Options:
        -?, -h, --help              Print this help message
        -v,     --version           Print the current Inkling version
        -m,     --template=path     Use an application template that lives at path (can be a filesystem path or URL) (Not implemented)
        -p,     --pretend           Run but do not make any changes.
                --force             Overwrite files that already exist.
        -s,     --skip              Skip files that already exist.
        -q,     --quiet             Suppress normal output.

Commands:
        generate name_of_new_content_type
                                    Generate a new blank Inkling content type

END

  class Generator
    attr_accessor :template_path, :pretend, :force, :skip, :quiet

    def start
      # Extract and save options:
      options = ARGV.select{|o| o =~ /^-/ }
      options.each{|o| option o }
      ARGV.delete_if{|o| options.include?(o)}

      # Process the command:
      case cmd = ARGV.shift
      when 'generate'
        generate
      else
        puts "Inkling: command #{cmd} unknown"
      end
    end

    def option arg
      case arg
      when '--help', '-h', '-?'
        puts USAGE
        exit(0)
      when '-m', /^--template=(.*)/
        template_path = $1 || ARGV.shift
      when '-p', '--pretend'
        pretend = true
      when '--force'
        force = true
      when '-s', '--skip'
        skip = true
      when '-q', '--quiet'
        quiet = true
      else
        puts "Inkling: option #{arg} unknown"
        puts USAGE
        exit(1)
      end
    end

    def generate
      puts "Generating using: #{ARGV*' '} is incomplete"
    end
  end
end
