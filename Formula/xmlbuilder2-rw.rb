class Xmlbuilder2Rw < Formula
  desc "Programmatic XML builder for JavaScript"
  homepage "https://github.com/oozcitak/xmlbuilder2"
  url "https://registry.npmjs.org/xmlbuilder2/-/xmlbuilder2-4.0.3.tgz"
  sha256 "ec05eccfe8c35a04ff19eddf30eeb3f96fc66f5dbe0f094e7c26a52fb69c2bdf"
  license "MIT"
  revision 1

  bottle do
    root_url "https://ghcr.io/v2/caraya/rivendellweb-homebrew"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8e9bf7580cf9b0da0dd0921ed837115b775a586139fab9c7160f9b7201aeff1e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "4c50bc4f15b2d885c03491fc9db29d750b2e85fe21c18cbe45a94a5e5f2873b8"
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    ENV["NODE_PATH"] = libexec/"lib/node_modules"
    (testpath/"test.js").write <<~JS
      const { create } = require("xmlbuilder2")
      const xml = create({ version: "1.0" }).ele("root").ele("msg").txt("ok").doc().end({ prettyPrint: false })
      console.log(xml)
    JS

    output = shell_output("#{Formula["node"].opt_bin}/node test.js")
    assert_match "<root><msg>ok</msg></root>", output
  end
end
