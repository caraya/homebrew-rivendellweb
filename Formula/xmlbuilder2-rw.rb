class Xmlbuilder2Rw < Formula
  desc "Programmatic XML builder for JavaScript"
  homepage "https://github.com/oozcitak/xmlbuilder2"
  url "https://registry.npmjs.org/xmlbuilder2/-/xmlbuilder2-4.0.3.tgz"
  sha256 "ec05eccfe8c35a04ff19eddf30eeb3f96fc66f5dbe0f094e7c26a52fb69c2bdf"
  license ""

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "65511f3f07bbcabd7d1aaca225f86207c844a388215425816ad273db659bdfab"
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
