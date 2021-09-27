require "language/node"

class FoundationCli < Formula
  desc "Command-line installer for Foundation family of frameworks"
  homepage "https://github.com/caraya/foundation-cli/"
  url "https://github.com/caraya/foundation-cli/archive/refs/tags/v2.2.7.tar.gz"
  sha256 "f2004ae3c68dc52ad20832ba46baac43f39ada1a03931238f5c1d3d72548d99e"
  license "MIT"

  bottle do
    root_url "https://github.com/caraya/homebrew-rivendellweb/releases/download/foundation-cli-2.2.7"
    sha256 cellar: :any_skip_relocation, catalina:     "3d204f3fbd5c3328717b1d27db0ddc0752dd51cb2f57cab57faeca21b916b486"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1c07f140486b7fd42040193b7d20ffd01154c1a082464e1d420be33d8f2320a6"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    puts "Tests under development"
  end
end
