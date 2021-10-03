class WeasyprintRw < Formula
  include Language::Python::Virtualenv

  desc "Open source CSS and HTML to PDF converter"
  homepage "https://weasyprint.org/"
  url "https://files.pythonhosted.org/packages/6c/36/8cbddf88d25260723e6d5d7b15b1cbfa86241cd30a65ba15ba51a1901a49/weasyprint-53.3.tar.gz"
  sha256 "eab32acf81d14b6626e5e180c7f03b925ece915a69b314ce3061a0f3ec6bf9da"
  license "BSD-3-Clause"

  depends_on "libffi"
  depends_on "pango"
  depends_on "python"

  resource "Brotli" do
    url "https://files.pythonhosted.org/packages/2a/18/70c32fe9357f3eea18598b23aa9ed29b1711c3001835f7cf99a9818985d0/Brotli-1.0.9.zip"
    sha256 "4d1b810aa0ed773f81dceda2cc7b403d01057458730e309856356d4ef4188438"
  end

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/2e/92/87bb61538d7e60da8a7ec247dc048f7671afe17016cd0008b3b710012804/cffi-1.14.6.tar.gz"
    sha256 "c9a875ce9d7fe32887784274dd533c57909b7b1dcadcc128a2ac21331a9765dd"
  end

  resource "cssselect2" do
    url "https://files.pythonhosted.org/packages/ad/3d/fb764303deb34cbc1a32fcecdfd239367cb16323920c88390b2f5ad751f0/cssselect2-0.4.1.tar.gz"
    sha256 "93fbb9af860e95dd40bf18c3b2b6ed99189a07c0f29ba76f9c5be71344664ec8"
  end

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/37/8b/867cdac69d5212b3eee781e40cfe539c4d9d7b2d4c9290bcdecd2d218176/fonttools-4.27.1.zip"
    sha256 "6e483f77dc5b862452c2888ec944fca5b79cffb741c7469786a442360681b4e8"
  end

  resource "html5lib" do
    url "https://files.pythonhosted.org/packages/ac/b6/b55c3f49042f1df3dcd422b7f224f939892ee94f22abcf503a9b7339eaf2/html5lib-1.1.tar.gz"
    sha256 "b2e5b40261e20f354d198eae92afc10d750afb487ed5e50f9c4eaf07c184146f"
  end

  resource "Pillow" do
    url "https://files.pythonhosted.org/packages/90/d4/a7c9b6c5d176654aa3dbccbfd0be4fd3a263355dc24122a5f1937bdc2689/Pillow-8.3.2.tar.gz"
    sha256 "dde3f3ed8d00c72631bc19cbfff8ad3b6215062a5eed402381ad365f82f0c18c"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/0f/86/e19659527668d70be91d0369aeaa055b4eb396b0f387a4f92293a20035bd/pycparser-2.20.tar.gz"
    sha256 "2d475327684562c3a96cc71adf7dc8c4f0565175cf86b6d7a404ff4c771f15f0"
  end

  resource "pydyf" do
    url "https://files.pythonhosted.org/packages/2d/6d/f2515b07799c869b7b0de81a05fe3dc620b9022a4397b9c70721b1ba1189/pydyf-0.1.1.tar.gz"
    sha256 "1a6eb2bb94c49eebe4cbd69c8c3c5664b16857cdf00e8347bff97b40c72a33e8"
  end

  resource "pyphen" do
    url "https://files.pythonhosted.org/packages/9a/f8/af869a4983c1b3159945479510260985714265d48baf27d61f72b1ec8cbf/pyphen-0.11.0.tar.gz"
    sha256 "e2c3ed82c3a04317df5102addafe89652b0876bc6c6265f5dd4c3efaf02315e8"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/71/39/171f1c67cd00715f190ba0b100d606d440a28c93c7714febeca8b79af85e/six-1.16.0.tar.gz"
    sha256 "1e61c37477a1626458e36f7b1d82aa5c9b094fa4802892072e49de9c60c4c926"
  end

  resource "tinycss2" do
    url "https://files.pythonhosted.org/packages/ce/d3/ece7a98d5826bd134e269a3a3030153d30482194fca71d95a3041812aab8/tinycss2-1.1.0.tar.gz"
    sha256 "fbdcac3044d60eb85fdb2aa840ece43cf7dbe798e373e6ee0be545d4d134e18a"
  end

  resource "webencodings" do
    url "https://files.pythonhosted.org/packages/0b/02/ae6ceac1baeda530866a85075641cec12989bd8d31af6d5ab4a3e8c92f47/webencodings-0.5.1.tar.gz"
    sha256 "b36a1c245f2d304965eb4e0a82848379241dc04b865afcc4aab16748587e1923"
  end

  resource "zopfli" do
    url "https://files.pythonhosted.org/packages/22/a3/bafb06f33bc196ad962b0206791e12e2e3069fcc98b61cbc36df430d95cc/zopfli-0.1.8.zip"
    sha256 "8b977dc07e3797907ab59e08096583bcd0b7e6c739849fbbeec09263f6356623"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/weasyprint", "http://weasyprint.org weasyprint-website.pdf"
    assert_predicate testpath/"weasyprint-website.pdf", :exist?
  end
end
