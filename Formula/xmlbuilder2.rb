require "language/node"

class Xmlbuilder2 < Formula
  desc "XML builder for node.js"
  homepage "https://github.com/oozcitak/xmlbuilder2"
  url "https://registry.npmjs.org/xmlbuilder2/-/xmlbuilder2-3.0.2.tgz"
  sha256 "b3a9bb4194aff1943d3be8a8353176123c5af5d65c0e589ff04f2275772c4848"
  license "MIT"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/caraya/homebrew-rivendellweb/releases/download/xmlbuilder2-3.0.2"
    sha256 cellar: :any_skip_relocation, catalina:     "aea5c77c968075e47f443a339ffebb7661f6039b4be2305a322da667798fe5c3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "cf5b0d0e6bd327b5bc729b18711f8d6c8a7f8de32aa06d1aa3b90045d427780f"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    # raise "Test not implemented."
    puts "Test not implemented."
  end
end
