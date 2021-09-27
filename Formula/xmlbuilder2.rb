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
