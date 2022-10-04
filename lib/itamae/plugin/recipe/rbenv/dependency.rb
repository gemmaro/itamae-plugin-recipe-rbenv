# Dependencies to install x.y.z (see also: development_dependency.rb)
# https://github.com/rbenv/ruby-build/wiki#suggested-build-environment
case node[:platform]
when 'debian', 'ubuntu', 'mint'
  package 'build-essential'
  package 'libffi-dev'
  package 'libgdbm-dev'
  if node[:platform] == 'ubuntu' && node[:platform_version] >= '20.04'
      package 'libgdbm6'
      package 'libreadline-dev'
  elsif node[:platform] == 'ubuntu' && node[:platform_version] >= '18.04'
      package 'libgdbm5'
      package 'libreadline-dev'
  elsif node[:platform] == 'debian' && (node[:platform_version].to_f >= 10.0 || node[:platform_version].include?("testing"))
    package 'libgdbm6'
    package 'libreadline-dev'
  else
    package 'libgdbm3'
    package 'libreadline6-dev'
  end
  package 'libgmp-dev'
  package 'libncurses5-dev'
  package 'libssl-dev'
  package 'libyaml-dev'
  package 'rustc' # for yjit
  package 'zlib1g-dev'
when 'redhat', 'fedora', 'amazon' # redhat includes CentOS
  package 'bzip2'
  package 'gcc'
  package 'make'
  package 'gdbm-devel'
  package 'gmp-devel'
  package 'libffi-devel'
  if node[:platform] == 'redhat' && node[:platform_version].to_f < 8.0
    package 'libyaml-devel'
  else
    # rust package only provide after rhel 8
    package 'rust' # for yjit
  end
  package 'ncurses-devel'
  package 'openssl-devel'
  package 'readline-devel'
  package 'zlib-devel'
when 'osx', 'darwin'
  package 'libffi'
  package 'libyaml'
  package 'openssl'
when 'arch'
  package 'base-devel'
  package 'gmp'
  package 'libffi'
  package 'libyaml'
  package 'openssl'
  package 'rust' # for yjit
  package 'zlib'
when 'opensuse'
  package 'bzip2'
  package 'gcc'
  package 'make'
  package 'gdbm-devel'
  package 'gmp-devel'
  package 'libffi-devel'
  package 'libyaml-devel'
  package 'ncurses-devel'
  package 'libopenssl-devel'
  package 'readline-devel'
  package 'rust' # for yjit
  package 'zlib-devel'
when 'gentoo'
  package 'bzip2'
  package 'gcc'
  package 'make'
  package 'gdbm'
  package 'libffi'
  package 'libyaml'
  package 'ncurses'
  package 'openssl'
  package 'readline'
  package 'zlib'
when 'freebsd'
  package 'lang/gcc'
  package 'databases/gdbm'
  package 'devel/gmake'
  package 'devel/gmp'
  package 'devel/libffi'
  package 'textproc/libyaml'
  package 'devel/ncurses'
  package 'security/openssl'
  package 'lang/rust' # for yjit
  package 'devel/readline'
when 'openbsd'
  package 'bzip2'
  package 'gdbm'
  package 'libffi'
  package 'libyaml'
  package 'openssl'
  package 'readline'
else
  raise NotImplementedError, "Platform '#{node[:platform]}' is not supported by rbenv::dependency yet"
end

package 'git'
