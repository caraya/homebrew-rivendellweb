class FoundationCli < Formula
  desc "Command-line installer for Foundation family of frameworks"
  homepage "https://github.com/caraya/foundation-cli/"
  url "https://github.com/caraya/foundation-cli/archive/refs/tags/v2.2.7.tar.gz"
  sha256 "cded4a08e3fd8f7e3329784076c6067fb34a2a598b96c6424a34e677cbd9f831"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    puts "test under development"
  end
end
