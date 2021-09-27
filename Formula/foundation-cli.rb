require "language/node"

class FoundationCli < Formula
  desc "Command-line installer for Foundation family of frameworks"
  homepage ""
  url "https://github.com/caraya/foundation-cli/archive/refs/tags/v2.2.7.tar.gz"
  sha256 "f2004ae3c68dc52ad20832ba46baac43f39ada1a03931238f5c1d3d72548d99e"
  license "MIT"

  depends_on "node"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    puts "Tests under development"
  end
end
