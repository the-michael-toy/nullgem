Gem::Specification.new do |gem|
  gem.name          = "nullgem"
  gem.version     = begin
    head_sha          = %x{git rev-parse HEAD}.strip
    tag_version       = %x{git name-rev --tags --name-only #{head_sha}}.strip
    untracked_files   = (%x{git ls-files --others --exclude-standard}.strip != '')
    _diff_status_only =  %x{git diff --quiet --exit-code HEAD}
    head_diff = ($?.exitstatus != 0)

    version = (tag_version =~ /^\d+\.\d+\.\d+$/) ? tag_version : "0.0.0.#{head_sha[0..7]}"
    dev_tag = (untracked_files || head_diff) ? '-dev' : ''

    version + dev_tag
  end
  gem.date          = '2012-03-04'
  gem.authors       = ["Michael Toy"]
  gem.email         = ["michael@toyland.org"]
  gem.description   = %q{A gem which does nothing, for testing}
  gem.summary       = %q{null gem}
  gem.homepage      = "https://github.com/the-michael-toy/nullgem"
  gem.files         = [ 'lib/nullgem.rb' ]
  gem.license       = 'unlicense'
end
